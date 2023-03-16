# This is a Chef Infra Client attributes file. It can be used to specify default
# and override attributes to be applied to nodes that run this cookbook.

# Set a default name
default['example']['name'] = 'Sam Doe'
default['audit']['reporter'] = %w(chef-server-automate cli)
default['audit']['fetcher'] = 'chef-server'
default['audit']['profiles']['User ivantest exist'] = {
  'name': 'user ivantest exist',
  'compliance': 'admin/create-user',
}
default['audit']['compliance_pahase'] = true
