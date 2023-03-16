class firewallon {
  registry::value { 'firewalldomain':
    key		=> 'HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile',
    value 	=> 'EnableFirewall',
    type	=> 'dword',
    data	=> '1',
  }
  registry::value { 'firewallstandard':
    key		=> 'HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile',
    value 	=> 'EnableFirewall',
    type	=> 'dword',
    data	=> '1',
  }
  registry::value { 'firewallPublic':
    key		=> 'HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile',
    value 	=> 'EnableFirewall',
    type	=> 'dword',
    data	=> '1',
  }
}
