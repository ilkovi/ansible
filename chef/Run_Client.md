


# run command directly
chef-run myuser@rhel-1 package ntp -i ~/.ssh/mykey.pem   

# run recipe the same way

chef-run myuser@rhel-1 myrecipe.rb ~/.ssh/mykey.pem


# run chef on multiple nodes simtaniously

chef-run myuse@rhel-[1:4] my_recipe.rb -i ~/.ssh/mykey.pem



