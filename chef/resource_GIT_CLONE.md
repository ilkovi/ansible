


# the actual name is "deploy_revision"

# Control and manage a deployment of code from source control (such as a Rails application):


# Clone and sync an application from revision control
deploy_revision '/opt/my_app' do
  repo 'git://github.com/username/app.git'
end