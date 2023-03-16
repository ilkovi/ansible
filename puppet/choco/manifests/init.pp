class choco {

$packages = [ "notepadplusplus", "firefox", "flashplayerplugin"  ]

  package { $packages:
    ensure 	=> latest,
    provider	=> 'chocolatey',
  }

#  package { 'notepadplusplus':
#    ensure => installed,
#    provider => 'chocolatey',
#  }

#  package { 'firefox':
#    ensure => installed,
#    provider => 'chocolatey',
#  }

}
