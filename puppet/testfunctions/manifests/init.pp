# just testing some stdlib functions
class testfunctions {
 $strvar1 = 'tHis IS A text.'

 notify { "This is the default text: ${strvar1}": }

 $strup1 = upcase($strvar1)
 notify { "This is the upcase function output: ${strup1}":}

 $strdown1 = downcase($strvar1)
 notify { "This is the downcase function outpu: ${strdown1}":}

 $strcap1 = capitalize($strvar1)
 notify { "This is the capitalize function output: ${strcap1}":}

 # just test some password hash. function of the STDLIB module
 
 $strpass1 = pw_hash($strvar1,'SHA-512','salty')
 notify { "This is the pw_hash function output: ${strpass1}":}


 # test our first custom function
 # TBD, could not access the functio
 # /usr/share/foreman-installer/modules/stdlib/lib/puppet/parser/functions
# $strtest1 = myfirstfunction('test123')
# notify { "This is the myfirstfunction function output: ${strtest1}":}

}
