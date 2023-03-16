###  FOR EACH LINE IN A FILE

while read line; do chmod o+rw $line ; done < list


####  Second way 

IFS=$'\n'		# inache , vyrti vsqka duma ... na vseki red
for line in $(cat "/tmp/.${ESXI_SERV}"); do
	echo $line
do



### Third way

#!/bin/bash
 #filename="/root/shell/new.html"


 NAMES="$(< /root/shell/host_lists)" #names from names.txt file
 for NAME in $NAMES; do
     echo "$NAME"
 sleep 4
 done 




### Example

#!/bin/bash
 for NAME in sncpuser sguuser rmuser dguuser apiuser workflow cbsuser ;
 do   /bin/cat /etc/passwd |grep ^${NAME} >> /dev/null
      if [ $? == 0 ]; then  echo -e "${NAME}  \t[ OK ]"; else echo -e "${NAME} [ FAIL ]"; fi
 done
 
 