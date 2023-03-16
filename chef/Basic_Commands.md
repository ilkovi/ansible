
ChefDK default dir C:\opscode\

## client version

chef-client --version


## where gems are installed

 gem env
 
 -> look for INSTALLATION DIRECTORY
 
 
### install gem
gem install test-kitchen --no-ri --no-rdoc

 -> --no-ri and --no-rdoc parameters save time by omitting the step that generates documentation


### check if gem is installed
gem list test-kitchen -i




### Check ruby syntax

ruby -c /path/to/ruby/file


### good book

Practical Object-Oriented Design in Ruby




### Hashes in Ruby
1
prices = { oscar: 4.55, boars: 5.23, wright: 4.65, beelers: 6.99 } 

prices[:oscar] #=> 4.55


2
hash = { 'key' => value } 		# => is called the rocket
hash['key'] 					#=> value . NOTE hte key definition is changed



3. Chef uses mash
mash = Hashie::Mash.new({key: value})
mash[:key]  #=> value 
mash['key'] #=> value 
mash.key	#=> value
















