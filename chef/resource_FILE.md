
# 
File over array
['bacon', 'eggs', 'sausage'].each do |type|
  file "/tmp/#{type}" do
    content "#{type} is delicious!"
  end
end

=

file '/tmp/bacon' do 
	content 'bacon is delicious!'
end
file '/tmp/eggs' do 
	content 'eggs is delicious!'
end
file '/tmp/sausage' do 
	content 'sausage is delicious!'
end





### EX 2

file '/etc/motd' do
  action :create
  content "Welcome to #{node['hostname']}!\n"
end



### EX delete

# Delete the /tmp/bacon file
file '/tmp/bacon' do
  action :delete
end



