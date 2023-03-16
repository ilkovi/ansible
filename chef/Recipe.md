# my_recipe.rb

package 'ntp' do
  action :install
end


file '/etc/motd' do
  action :create
  content "Welcome to #{node['hostname']}!\n"
end


### NOTE : we could use facts - node

