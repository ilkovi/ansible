class disablesmb {

  service { 'SensorService':
    ensure => stopped,
    enable => false,
  }

  service { 'LanmanServer':
    ensure => stopped,
    enable => false,
    require => Service['SensorService'],
  }
}
