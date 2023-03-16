

template '/etc/resolv.conf' do 
  source 'my_resolv.conf.erb' 
  owner 'root' 
  group 'root' 
  mode '0644'
end



# If you specify an invalid parameter (either one that does not exist or is misspelled)

NoMethodError 
------------
undefined method `not_a_real_parameter' for Chef::Resource



# EX 2

# Manage plain-text file contents parsed as an Embedded Ruby template:

template '/tmp/bacon' do
  source 'bits.erb'
end