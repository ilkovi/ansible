class helloworld { 
  file { 'c:/Windows/Temp/hello.txt':
#   source => 'puppet:///modules/helloworld/hello.txt',
    content => template('helloworld/hello.erb'),
    source_permissions => ignore,
#    content => "Hello World",
  }
  file { 'c:/windows/temp/helloworld':
    ensure => 'directory',
    source_permissions => ignore,
  }
}
