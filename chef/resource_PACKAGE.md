
package 'ntp' do
  action :install
end

package 'ntp' do 
  action :upgrade
end



# Install a package using the operating system’s underlying package manager

# Install the apache2 package (on Debian-based systems) 
package 'apache2'
