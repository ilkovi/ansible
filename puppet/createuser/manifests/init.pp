class createuser {

  user { 'testuser':
    ensure 	=> 'present',
    name 	=> 'puppetuser',
    comment 	=> 'Puppet User',
    groups	=> [ 'Users' ],
    password 	=> 'Qwwer1234',
  }

}
