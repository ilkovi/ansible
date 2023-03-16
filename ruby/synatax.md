

# check ruby syntax

ruby -c /path/to/ruby/file



# comments

# Code tells you how, comments tell you why.


##  variables

a = 1 			# digit
b = 'hello' 	# string
c = Object.new	# object


# call a function

Math.hypot(43, 57) #=> 71.40028011149536


# quotes differences

"#{x} world" #=> "hello world"
'#{x} world' #=> '#{x} world'




# multiline text


<<METHOD_DESCRIPTION 
This is a multiline string.
All the whitespace is preserved, and I can even apply #{interpolation} inside
this block. 
METHOD_DESCRIPTION





### compares
	
!!true		#=> true
not nil		#=> true



### Arrays

types = ['crispy', 'raw', 'crunchy', 'grilled']

types.push 'smoked' #=> ["crispy", "raw", "crunchy", "grilled", "smoked"]

types << 'deep fried' #=> ["crispy", "raw", "crunchy", "grilled", "smoked", "deep fried"]





#### HASHES

prices = { oscar: 4.55, boars: 5.23, wright: 4.65, beelers: 6.99 }

prices[:oscar] #=> 4.55

prices[:oscar] = 1.00   # set value for a key

prices[:oscar] #=> 1.00

# Hashes respond to helpful methods like keys and values
prices.values #=> [1.00, 5.23, 4.65, 6.99]




# rocket sign ( => ) in hash 

hash = { 'key' => value } 

# noticy the way in which the key is accessed also changes
hash['key'] #=> value





# RUBY MASH ~?1~

mash = Hashie::Mash.new({key: value})

mash[:key] 	#=> value 
mash['key'] #=> value 
mash.key	#=> value

# Hashie::Mash is not part of the core Ruby library






##### Regular Expressions

"Bacon is good" =~ /lie/	#=> nil
"Bacon is good" =~ /bacon/ 	#=> 0
"Bacon is good" !~ /lie/	#=> true




# Regular expressions can be anchored using the caret (^)
players.select do |name, statistics|
 name =~ /^F/
end






### conditions

# Using unless = if not
unless some_condition
	puts "didn't happen"
else
	puts "happened
end





# Less common in Ruby (but common in Chef) is the case statement

case some_condition 
when "literal string" 		# 
	# ...
when /regular expression/ 	# Ruby will attempt to call match on the receiving object.
	# ...
when list, of, items 		# If multiple items , they are interpreted as “or” (if the item matches “list”, “of”, or “items”).
	# ...
else 						# default case, in the event that nothing else matches
	# ... 
end









###### Methods, Classes, and Modules

## Ruby methods are defined using the def keyword

# Methods are also chainable in Ruby
"String".upcase.downcase.reverse #=> "gnirts"

# both method calls are ok
my_method(5) 
my_method 5


## Ruby classes are defined using the class keyword

class Bacon
  def cook(temperature) 			### method
	# ...
  end 
end



## Ruby modules are defined using the module keyword:

module Edible 
	# ...
end




























