#!/usr/bin/perl
### start_cloud.pl program
### Created by: Ivan Ilkov
### Last update: 22/04/14

use XML::LibXML;        # this provides the xml validator
use Data::Dumper;       # Allows printing an array
use FindBin;            # Locates directory of perl script
use File::Basename;     # provides the dirname() function
#use Storable;           # provides store() to write hash to file
use Getopt::Long;	# For GetOptions subrotine

###### General Variables ###########
## General variables
my $programName         = basename $0;
my $executionID         = int(rand(1000));
my $scriptDir           = "$FindBin::Bin";
our $LOGFILE            = "$scriptDir/logs/start_cloud.log";
my $MAX_OLD_LOG         = 7;    # parameter to rotateLogFile

############# Program Setup Tasks ######################

## Place getops here because I don't want help executions logged
GetOptions (
  "help|h"              => \$help
) or Die ("Invalid parameter supplied...use --help for help!");

if ($help){
        &usage();
        exit 1;
}


## Create log dir and rote log file
system("/bin/mkdir $scriptDir/logs") unless( -e "$scriptDir/logs");
rotateLogFile($LOGFILE, $MAX_OLD_LOG) if (-e $LOGFILE);
LogScreen("STARTED: $0 @ARGV");
LogScreen("\n\tLogs are written to:[ $LOGFILE ]\n");



## define variables
my $strgCfgFile = "$scriptDir/conf/conf.xml";
my $parser = XML::LibXML->new;
my $parsedXML = eval { $parser->parse_file($strgCfgFile) } or do {
	my @t = $@;
	LogScreen("\n\t [ $strgCfgFile ] is not a well formed XML!\n");
	Die(@t);
};
LogScreen("\t[ $strgCfgFile ] is well formed XML configuration file...proceeding.\n");

my $server_hash = {};     		# define an anonymous hash
my ($esxi_ip_list, $esxi_DS, $l_dir);	# define some global varible

#################################### Function Calls ###############################################

validateConfig($parsedXML);

($server_hash, $esxi_ip_list, $esxi_DS, $l_dir) = extractGlobalVarible($parsedXML);

checkESXiConnection($esxi_ip_list, $esxi_DS);

startCloning($server_hash,$esxi_ip_list, $esxi_DS, $l_dir);

insertConfiguration($server_hash, $l_dir);

registerVMtoESXi($server_hash, $esxi_ip_list, $esxi_DS);

LogScreen ("\n Program Finished Succesfully !!");

################################### Function Declaration ##########################################

sub validateConfig {
        my ($parsedXML)=@_;
        Die("Expected parameter not given to this function!") if ($strgCfgFile eq "");

	my $subName=(caller(0))[3];
	LogScreen("STARTING FUNCTION: $subName");

        # get the root element
        my $docElement = $parsedXML->getDocumentElement();      ## This is a function of LibXML

        if($docElement->hasAttributes()) {                      ## This is a function of LibXML
                my $schemaLoc = $docElement->getAttribute('xsi:noNamespaceSchemaLocation');
                my $cfgdir = dirname($strgCfgFile);
                $defined_schema = "$cfgdir/$schemaLoc";
                $schema = eval { XML::LibXML::Schema->new(location => $defined_schema); } or do {
                        my @t = $@;
                        LogScreen( "$defined_schema failed to be loaded!");
                        die @t ;
                };

                $schema_file = $defined_schema;
                LogScreen("\n\tDefined schema file [ $schema_file ] is well formed...");
        } else {
                Die("XML configuration file needs to have xsi:noNamespaceSchemaLocation defined on the root element for schema validation!");
        }

        LogScreen ("\n\tValidating XML against the Schema...");
        eval { $schema->validate($parsedXML) } or do { die $@ if $@;};


        LogScreen ("\n\t[ $strgCfgFile ] validated successfully\n");

} ## End sub parseAndValidateConfig

sub extractGlobalVarible {

	my (@DNS, @esxi_ip_array);					
	my ($esxi_ip_list, $esxi_DS, $l_dir);				# ESXi variables
	my ($vm_name,$vm_type,$vm_hostname,$vm_ip,$vm_nmask, $error);	# VM variables
        my ($parsedXML)=@_;
        Die("Expected parameter not given to this function!") if ($strgCfgFile eq "");

        my $subName=(caller(0))[3];
        LogScreen("STARTING FUNCTION: $subName");


    # Extract the ESXi information
    foreach my $esxi ( $parsedXML->getElementsByTagName('VMware') ) {
	
	$esxi_ip_list    = $esxi->getAttribute('ESXi_list');
        $esxi_DS         = $esxi->getAttribute('Datastore');
        $l_dir	         = $esxi->getAttribute('LocalDir');

		# Validate ESXi IP addresses
                LogScreen("\n\t Validating the IP addresses for the ESXi .");
		@esxi_ip_array    = split(/,/,$esxi_ip_list);

		foreach ( @esxi_ip_array ) {
	                if ($_ =~/^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$/ &&(($1<=255  && $2<=255 && $3<=255  &&$4<=255 ))) {
                                LogScreen("\n\t\t ESXi IP address [ $_ ] is [ OK ].");
                        } else {
        	                LogScreen("\n\t\t ESXi IP address [ $_ ] is [ Fail ]. Program will quit.");
                	        $error = " ESXi IP address [ $_ ] is [ Fail ].";
                        }
		}
	
		# Validate ESXi DataStore Name
		if ( $esxi_DS =~ /\/vmfs\/volumes\/\w+\/*/ ) {
			LogScreen("\n\t\t ESXi DataStore name is [ OK ].");
		} else {
			LogScreen("\n\t\t ESXi DataStore name is [ NOT OK ]. Program will quit");
			$error = "ESXi DataStore name is [ NOT OK ]. ";
		}

		# Validate Local Mount Folder
		if ( $l_dir =~ /\w+\/$/ ) {$l_dir = s/\/$//g} 
		my $command = "/bin/touch $l_dir && echo 0";
		my $result = qx{$command};
			if ($result) {
				LogScreen("\n\t\t Local Mount point Directory  is [ OK ].");
			} else {
				LogScreen("\n\t\t Local Mount point Directory  is [ NOT OK ]. Program will quit.");
				$error = "Local Mount point Directory  is [ NOT OK ]. Program will quit.";
			}

    }

	# Extract VM information
	foreach my $vm ( $parsedXML->getElementsByTagName('Server') ) {

                $vm_name = $vm->getAttribute('VMname');
                $vm_type = $vm->getAttribute('Type');
                $vm_tmpn = $vm->getAttribute('Template_name');

                foreach my $vm_ip_loop ( $vm->getElementsByTagName('IP') )  {
                                $vm_ip = $vm_ip_loop->getFirstChild->nodeValue;
                        }

                foreach my $vm_nmask_loop ( $vm->getElementsByTagName('Netmask') )  {
                                $vm_nmask = $vm_nmask_loop->getFirstChild->nodeValue;
                        }

                foreach my $vm_gw_loop ( $vm->getElementsByTagName('Gateway') )  {
                                $vm_gw = $vm_gw_loop->getFirstChild->nodeValue;
                        }

		@DNS = ();
                foreach my $vm_dns_loop ( $vm->getElementsByTagName('DNS') )  {
                                my $vm_dns = $vm_dns_loop->getFirstChild->nodeValue;
				push(@DNS,$vm_dns);
                        }

			# Validate VM Name
			LogScreen("\n\t Validating the name $vm_name . Names must be unique. Program will now warn you about identical names !");
				if ( $vm_name =~/\w/ ) {
					LogScreen("\n\t\t VM $vm_name is [ OK ].");
				} else {
					LogScreen("\n\t\t VM $vm_name is [ Fail ]. The name should have digits letters and \"_\" only.");
					$error = "VM $vm_name is [ Fail ]. The name should have digits letters and \"_\" only.";
				}

			# Validate VM Type
			LogScreen("\n\t Validating the Type for and Template for $vm_name .");
			my $vm_type_check = lc($vm_type);
				if ( ( $vm_type_check eq "hosting" ) or ( $vm_type_check eq "dns") or ( $vm_type_check eq "share") ) {
					LogScreen("\n\t\t VM $vm_name Type [ $vm_type ] is [ OK ].");
				} else { 
					LogScreen("\n\t\t VM $vm_name Type [ $vm_type ] is [ Fail ]. VM Type must be Hosting or DNS or Share .");
					$error = "VM $vm_name Type [ $vm_type ] is [ Fail ]. VM Type must be Hosting or DNS or Share .";
				}

			# Validate VM Template
			my $command = "/bin/ls $l_dir/$vm_tmpn | grep $vm_tmpn |wc -l";
			my $result = qx{$command};
	                        if ($result > 0) {
        	                        LogScreen("\n\t\t Template [ $vm_tmpn ] could be found in [ $l_dir ].");
                	        } else {
                        	        LogScreen("\n\t\t Template [ $vm_tmpn ] could NOT  be found in [ $l_dir ]. Program will quit !");
                                	$error = " Template [ $vm_tmpn ] could NOT  be found in [ $l_dir ]. Program will quit !";
	                        }

			# Validate VM IP addresses
			LogScreen("\n\t Validating the IP addresses for the VM $vm_name .");
			foreach my $my_ips ($vm_ip,$vm_nmask, $vm_gw,@DNS) {
				if ($my_ips=~/^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$/ &&(($1<=255  && $2<=255 && $3<=255  &&$4<=255 ))) {
					LogScreen("\n\t\t VM $vm_name IP address [ $my_ips ] is [ OK ].");
				} else {
					LogScreen("\n\t\t VM $vm_name IP address [ $my_ips ] is [ Fail ]. Program will quit.");
					$error = "error";
				}

			}

		# Populate server_hash with VM details
        	$server_hash->{$vm_name}={};
	        $server_hash->{$vm_name}->{'type'}=$vm_type;
        	$server_hash->{$vm_name}->{'template'}=$vm_tmpn;
	        $server_hash->{$vm_name}->{'ip'}=$vm_ip;
	        $server_hash->{$vm_name}->{'mask'}=$vm_nmask;
	        $server_hash->{$vm_name}->{'gw'}=$vm_gw;
		my $DNS_list=join(",",@DNS);
	        $server_hash->{$vm_name}->{'dns'}=$DNS_list;

	} # End ForEach VM Extract

  (Die("$error. Please check and retry.") && exit 0) if ($error);
	
  return ($server_hash, $esxi_ip_list, $esxi_DS, $l_dir);

} # End of extractGlobalVarible

sub checkESXiConnection{

  my ($esxi_list, $DS)=@_;
  my $error;	
  my @esxi_ip_array    = split(/,/,$esxi_list);

  my $subName=(caller(0))[3];
  LogScreen("\nSTARTING FUNCTION: $subName");

	# Check connection and ssh to ESXi Hosts
	LogScreen("\n\t Check ESXi for connection.");

	foreach ( @esxi_ip_array ) {
		if ( checkConnection($_) ) {
		LogScreen("\n\t\t ESXi IP  [ $_ ] is pingable.");

		LogScreen("\n\t Check ESXi IP  [ $_ ] for installed SSH Keys.");
			if ( checkSSH($_) ) {
				LogScreen("\n\t Remote Host [ $_ ] is accessible with SSH keys.");
			} else {
				LogScreen("\n\t\t No keys are installed on the remote host.\n\n");
				doUserWantSSHKey();
				createSSHKey( $_ );
				LogScreen("\n\t Now host [ $_ ] is configured with SSH keys.");
			}
                        checkDS($_, $DS);
		} else {
			LogScreen("\n\t\t Error [ $_ ] ");
			$error = "ESXi IP [ $_ ] is NOT pingable. Check connection or remove it from conf File .";
		}

	}

  (Die(" $error") && exit 0) if ($error);	

} # End of checkConfiguration

sub checkConnection {

        my ($IP_to_check)=@_;
        my $received;

        my $check_connection = "/bin/ping $IP_to_check -c 3 -i 0.1 | grep received";
        my @check = qx{$check_connection};

                foreach my $row (@check) {
                        if ($row =~ /,\s+(\d+)\s+received/) {
                        $received = $1;
                        }
                }
   return($received);

} # End of checkConnection

sub checkSSH {

	my ($IP_to_check)=@_;
	my $isVMware = "yes";

	my $check_SSH = "/usr/bin/ssh -o BatchMode=yes -o ConnectTimeout=5 $IP_to_check echo ok 2>&1";
	my @check = qx{$check_SSH} ;

                foreach my $row (@check) {
                        if ($row =~ /^ok/) {
                        } else {
				$isVMware = "";
			}
                }
   return($isVMware);

} # End Check SSH

sub doUserWantSSHKey {

LogScreen ("This is the start Cloud program. It will configured SSH to remote host .");
LogScreen ("Enter 'y' if you want to continue. Later on you will be asked for remote host password .");
LogScreen ("Otherwise enter 'n' to quit (y|n) : ");

	my $answer=<stdin>;
	chomp($answer);
		if ( $answer eq "y" ) {
			LogScreen ("Good. Provide the root password for remote hsot. (question for adding the rhost to known hosts could be asked)");
		} else {
			LogScreen ("GOOD BYE !!");
			exit 1;
		}
} # End of do User Want SSH Key

sub createSSHKey {

  my $esxi_ip = "@_";
  my $scp_command = "/usr/bin/scp /root/.ssh/id_rsa.pub $esxi_ip:/etc/ssh/keys-root/authorized_keys";
  my $command = "[ -f /root/.ssh/id_rsa.pub ] && echo Foud";
  my @check = qx{$command} ;

	if (@check) {
		qx{$scp_command};
	} else {
		my $command1 = "/usr/bin/ssh-keygen -b 1024 -t rsa -C \"Start Cloud\" -N \"\" -f /root/.ssh/id_rsa";
		qx{$command1};
		qx{$scp_command};
	}

} # End of create SSH Key

sub checkDS{

  my ($esxi_ip, $DS) = @_;
  LogScreen("\n\t Last check DataStore [ $DS ] on host [ $esxi_ip ].");
	$DS =~ s/\/vmfs\/volumes\///g;
  	my $DS_real = $DS;

  	my $command = "/usr/bin/ssh $esxi_ip esxcli storage filesystem list |grep $DS_real";
	my @check = qx{$command} ;

		if (@check) {
			LogScreen("\n\t\t DataStore [ $DS ] is Presented on host [ $esxi_ip ].");
		} else {
			$error = "DataStore [ $DS ] is NOT Presented on host [ $esxi_ip ].";
		}
  (Die("\n$error. Please check and retry.") && exit 0) if ($error);
} # End of check DS

sub startCloning {

  my($vm_hash,$esxi_ip_list, $esxi_DS, $l_dir) = @_;
  my(@vm_to_build);

  my $subName=(caller(0))[3];
  LogScreen("\nSTARTING FUNCTION: $subName");

  my @esxi_ip_array    = split(/,/,$esxi_ip_list);

  foreach my $vm_name (keys %$vm_hash) {
        foreach my $element (keys %{$vm_hash->{$vm_name}} ) {
		next if ("$element" !~ /template/ );
		
		my $tmp_name = "$vm_hash->{$vm_name}->{'template'}";

			LogScreen("\n\tINFO: Cloning a virtual disk, this may take a while...\n");
			my $create_dir_command = "/usr/bin/ssh $esxi_ip_array[0] /bin/mkdir -p $esxi_DS/$vm_name";
			qx{$create_dir_command};

			my $command = "/bin/ls $l_dir/$tmp_name/*.vmdk |grep -v flat |wc -l";
			my $num_of_disks = qx{$command};

			# Start actula copying
			my $copy_command = "/usr/bin/ssh $esxi_ip_array[0] /sbin/vmkfstools -i $esxi_DS/$tmp_name/$tmp_name.vmdk $esxi_DS/$vm_name/$vm_name.vmdk";
			qx{$copy_command};
		
				if ($num_of_disks > 1) {
					for (my $i=1 , $i > $num_of_disks , $i++ ) {
				my $copy_command_2 = "/usr/bin/ssh $esxi_ip_array[0] /sbin/vmkfstools -i $esxi_DS/$tmp_name/$tmp_name\_$i.vmdk $esxi_DS/$vm_name/$vm_name\_$i.vmdk";
					qx{$copy_command_2};
					}
				}

			# Reconfigure vmx file
			my $reconf_command = "/bin/cp $l_dir/$tmp_name/$tmp_name.vmtx $l_dir/$vm_name/$vm_name.vmx";
			qx{$reconf_command};
	
			my $replace_command = "/bin/sed -i -r -e s/$tmp_name/$vm_name/g $l_dir/$vm_name/$vm_name.vmx";
			qx{$replace_command};

                        my $replace_command2 = "/bin/sed -i -r -e s/vpx/generated/g $l_dir/$vm_name/$vm_name.vmx";
                        qx{$replace_command2};

                        my $replace_command3 = "/bin/sed -i /generatedAddress/d $l_dir/$vm_name/$vm_name.vmx";
                        qx{$replace_command3};

	} # End foreah element in the hash
  } # End foreach vm_name in the hash


} # End of Start Cloning

sub insertConfiguration {

  my($vm_hash, $l_dir) = @_;
  my $error;

  my $subName=(caller(0))[3];
  LogScreen("\nSTARTING FUNCTION: $subName");

  #Some linux Staff
  $losetup="/sbin/losetup";
  $kpartx="/sbin/kpartx";

	# Creating a temporary directory
	my $tmp_dir = "$l_dir/temp_mount";

	if ( -d "$tmp_dir") {
		my $create_dir = "mkdir -p $tmp_dir";
		my $create_result = qx{$create_dir};
		
#			if (! $create_result = 0 ) {
#        	                $error = "Error Creating temporary directory [ $tmp_dir ]";
#                	        (Die("\n$error. Please check and retry.") && exit 0) if ($error);
#			}
	}

	# Find if programs exist
	LogScreen("\n\t Check if Losetup is installed");
	my $command = "/usr/bin/whereis losetup";
	my $losetup_result = qx{$command};

                if (! $losetup_result =~ /$losetup/ ) {
	                $error = "Losetup is not install on the system ! Please install it , then continue.";
        	        (Die("\n$error. Please check and retry.") && exit 0) if ($error);
                }
	LogScreen("\n\t Check if Kpartx is installed");
	my $command2 = "/usr/bin/whereis kpartx";
	my $kpartx_result = qx{$command2};
		if (! $kpartx_result =~ /$kpartx/ ) {
			$error = "Kpartx is not install on the system ! Please install it , then continue.";
			(Die("\n$error. Please check and retry.") && exit 0) if ($error);
		}

	# Loop for all VMs in the Hash
	foreach my $vm_name (keys %$vm_hash) {
	LogScreen("\n\tMounting Virtual Disk of VM [ $vm_name ]");

        # Find un_used loop device
        my $find_loop = "$losetup -f";
        my $loop = qx{$find_loop} ;
        $loop =~ s/\n//g;
	LogScreen("\n\t Find first free loop device [ $loop ]");

	LogScreen("\n\t\t Start Mounting Process ... [ $vm_name ] ");
	my $mount_command = "$losetup $loop $l_dir/$vm_name/$vm_name-flat.vmdk > /dev/null 2>&1";
	qx{$mount_command};

	LogScreen("\n\t\t Read partition table for [ $vm_name ] ");
	my $mount_command2 = "$kpartx -av $loop > /dev/null 2>&1";
	qx{$mount_command2};

		# Mount LVM
		LogScreen("\n\t\t LVM staus for [ $vm_name ] . ");
		my $scan_lvm = "/sbin/lvm vgscan";
		qx{$scan_lvm};

		my $sleep_command="sleep 1";
		qx{$sleep_command};

	        my $check_lvm = "/sbin/lvm lvs |grep root";
	        my $output = qx{$check_lvm};

	        $output =~ /(\s)*(\w+)\s(\w+)/;
	        my ($LV,$VG) = ($2,$3) ;
	        my $disable_locking = "/sbin/lvm vgchange --ignorelockingfailure -P -a y $VG  >/dev/null 2>&1";
	        qx{$disable_locking};

	        my $mount = "/bin/mount -t auto /dev/$VG/$LV $tmp_dir";
		qx{$mount};

	# Apply NW settings
	LogScreen("\n\t Apply Network settings.");
	my $nw_file = "$tmp_dir/etc/sysconfig/network-scripts/ifcfg-eth0";
	qx{/bin/cp $nw_file $nw_file.bak};
	qx{/bin/sed -i /IPADDR/d $nw_file};
	qx{/bin/sed -i /NETMASK/d $nw_file};
	qx{/bin/sed -i /ONBOOT/d $nw_file};
	qx{/bin/sed -i /BOOTPROTO/d $nw_file};
        qx{/bin/sed -i /HW/d $nw_file};

                my $vm_ip = "$vm_hash->{$vm_name}->{'ip'}";	
                my $vm_nm = "$vm_hash->{$vm_name}->{'mask'}";

	qx{/bin/echo IPADDR=$vm_ip >> $nw_file };
	qx{/bin/echo NETMASK=$vm_nm >> $nw_file };
	qx{/bin/echo ONBOOT=YES >> $nw_file };
	qx{/bin/echo BOOTPROTO=static >> $nw_file };

	# Apply Gateway
        my $vm_gw = "$vm_hash->{$vm_name}->{'gw'}";	
 	my $gw_file = "$tmp_dir/etc/sysconfig/network";

	qx{/bin/cp $gw_file $gw_file.bak};
	qx{/bin/sed -i /GATEWAY/d $gw_file};
	qx{/bin/echo GATEWAY=$vm_gw >> $gw_file };

	# Apply DNS	
        my $vm_dns = "$vm_hash->{$vm_name}->{'dns'}";	
        my @dns_array    = split(/,/,$vm_dns);
	my $dns_file = "$tmp_dir/etc/resolv.conf";

        qx{/bin/cp $dns_file $dns_file.bak};

        foreach ( @dns_array ) {
		qx{/bin/echo nameserver $_ >> $dns_file };
	}

	# Remove udev Rules
	LogScreen("\n\t Clear Udev Rules");
	qx{rm -rf $tmp_dir/etc/udev/rules.d/70-persistent-net.rules};
	qx{ln -s /dev/null $tmp_dir/etc/udev/rules.d/70-persistent-net.rules};

	# Apply Server Type
        my $vm_type = "$vm_hash->{$vm_name}->{'type'}";
	$vm_type = lc($vm_type);
	LogScreen("\n\t Appling Type [ $vm_type ]");

	qx{/bin/mkdir $tmp_dir/root/update > /dev/null};
	qx{/bin/cp -r /root/cloud/$vm_type/* $tmp_dir/root/update};

	my $update_src="/root/cloud/install_scripts/install_$vm_type.sh";
	qx{/bin/cp $update_src $tmp_dir/root/update};
	qx{/bin/cp $tmp_dir/etc/rc.local $tmp_dir/etc/rc.local.origin};
	qx{/bin/echo /root/update/install_$vm_type.sh >> $tmp_dir/etc/rc.local};

	# Unmount devices
	qx{/bin/umount $tmp_dir};

	my $deactiveate_lvm = "/sbin/lvm vgchange -a n $VG";
	qx{$deactiveate_lvm};

	my $unmount_command = "$kpartx -d $loop >/dev/null 2>&1";
	qx{$unmount_command};

        my $unmount_command2 = "$losetup -d $loop >/dev/null 2>&1";
        qx{$unmount_command2};

	}

} # End insert Configuration

sub registerVMtoESXi {
  my($vm_hash,$esxi_ip_list, $esxi_DS) = @_;
  my @esxi_ip_array = split(/,/,$esxi_ip_list);
  my $arrSize = @esxi_ip_array;
  my $i = 0;

  my $subName=(caller(0))[3];
  LogScreen("\nSTARTING FUNCTION: $subName");

        foreach my $vm_name (keys %$vm_hash) {

	if ($i == $arrSize) {$i = 0;}

	$register_command="/usr/bin/ssh $esxi_ip_array[$i] /bin/vim-cmd solo/registervm $esxi_DS/$vm_name/$vm_name.vmx $vm_name";
	my $vmid = qx{$register_command};	
	chomp($vmid);
	LogScreen("\n\tRegistering VM [ $vm_name ] to ESXi Host [ ESXi ] with vmid [ $vmid ] . ");

        LogScreen("\n\tPower on VM [ $vm_name ]");
	my $power_on = "vim-cmd vmsvc/power.on $vmid";
	qx{$power_on};

	$i++;
	} # End for each VM name


} # End of register VM to ESXi hosts

sub LogScreen {
 my $logs_to_display = "@_";

        print "$logs_to_display \n";
}

sub usage {
        print "\tUSAGE \n";
        print "\t --help|-h             : Help Menu\n";
        print "\t                       : For more information refer Documentation \n";
}

sub Die {

        my ($error)="@_";
        print "Error: $error \n";
        exit 0;
}

