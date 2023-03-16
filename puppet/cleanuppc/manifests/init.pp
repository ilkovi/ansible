# clanup windows 
class cleanuppc {
  exec { 'deltemp':
    command => 'cmd.exe /C del /Q /F /S C:\Windows\Temp\*.*',
    path    => 'C:\Windows\System32',
    creates=> 'C:\test\testfile.txt', 	# this file will not be created by puppet
#    subscribe => File['C:/windows/temp/helloworld/'],
#    refreshonly => true,
  }
}
