
## restart

service 'apache2' do
  restart_command '/etc/init.d/apache2 restart'
end



### Restart 2

# Restart the apache2 service
service 'apache2' do
  action :restart
end