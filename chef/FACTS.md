


### NOTE : we could use facts - node


free_memory = node['memory']['total']

file '/tmp/free' do 
	contents "#{free_memory} bytes free on #{Time.now}"
end