

ssh $1 'for NAME in sncpuser sguuser rmuser dguuser apiuser workflow cbsuser ;
 do   grep ^${NAME} /etc/passwd >> /dev/null
   if [ $? == 0 ]; then  echo -e "${NAME}  \t[ OK ]"; else echo -e "${NAME} [ FAIL ]"; fi
 done'
 
 