

#!/bin/bash
 TEST=`ssh $1 'ulimit -Sn'`

 if (( ${TEST} < 14001 )) ; then  echo -e "${TEST} \t[ OK ]"; else echo -e "${TEST} t\[ FAIL ]"; fi

 if [[ ${TEST} -lt 4001 ]] ; then  echo -e "${TEST} \t[ OK ]"; else echo -e "${TEST} t\[ FAIL ]"; fi