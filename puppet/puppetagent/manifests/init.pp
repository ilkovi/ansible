#
# install puppet agent using chocolatey
# sometimes run / sometimes not
# depends on the version
#
# always test the choco installation in advance
#
class puppetagent {
  package { 'puppet':
    ensure	=> '6.11.1',
    install_options	=> ['-override', '-installArgs', '"', '/QUIET', '/NORESTART', '"'],
    PROVIDER 	=> 'chocolatey',
  }
}
