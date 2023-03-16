

# Manage a directory or directory tree, handling permissions and ownership

# Recursively ensure a directory exists
directory '/opt/my/deep/directory' do
  owner	'root'
  group	'root'
  mode	'0644'
  recursive true
end



