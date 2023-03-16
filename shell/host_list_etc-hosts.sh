

egrep -i 'slu|ofr|eci|osa|notif|sgu|sapi|feadmin|ajms' /etc/hosts |grep -v - |grep -v _ |grep -v ^# | awk '{ print $2 }'>> host_list

