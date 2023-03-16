





#### Това проверява какви са адресите на SCSI контролерите. Последния мисля че е CD-то 

# ls /sys/class/scsi_device/
0:0:1:0  0:0:5:0  0:0:6:0  0:0:8:0  2:0:0:0



### Командата от долу, ресканира Съответния контролер. В нашия случай е първия. 

# echo 1 > /sys/class/scsi_device/0\:0\:1\:0/device/rescan


### Сега диска вече е по голям.

Disk /dev/sda: 21.5 GB, 21474836480 bytes, 41943040 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk label type: dos
Disk identifier: 0x0006e8f7


### Сега, ще видя и командите за разширяване на файловата система и пак ще пиша





LVLIST=`lvdisplay | egrep "LV\ Path" | awk '{print $NF}' | sed ':a;N;$!ba;s/\n/ /g'`


        for LV in $LVLIST; do
		if [ "${ANSWER}" == "${count}" ]; then
			VMSERVERNAME=${ESXI_SERV}
			PRINT_LOG " Selected ESXi is [ ${VMSERVERNAME} ]\n"
		fi
            VGPV = `lvdisplay -m $LV | egrep  "VG|Physical volume" | awk '{print $NF}' | sed ':a;N;$!ba;s/\n/ /g'`
        done


