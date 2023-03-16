#
# Cookbook:: example
# Recipe:: user
#
# Copyright:: 2021, The Authors, All Rights Reserved.

if platform?('windows')
  user 'ivantest' do
    manage_home true
    comment 'Ivan Ilkov'
    home 'C:\Users\ivantest'
    password 'password'
    action :create
  end
else
  user 'ivantest' do
    manage_home true
    comment 'Ivan Ilkov'
    home '/home/ivantest'
    shell '/bin/bash'
    password 'test'
  end

  package 'sudo'

  sudo 'ivantest' do
    user 'ivantest'
    nopasswd true
  end
end
