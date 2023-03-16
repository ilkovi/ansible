
for FILE in *.html ; do echo -e "<td>" >> new.html ;  cat ${FILE} >> new.html ; echo -e "</td>"  >> new.html; done