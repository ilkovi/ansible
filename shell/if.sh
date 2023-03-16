

 if [ -e /proc/ide/hdd ] ; then
     if grep disk /proc/ide/hda/media > /dev/null ;then
       exec_command "$HDPARM -t -T /dev/hdd" "Transfer Speed"
     fi
   fi