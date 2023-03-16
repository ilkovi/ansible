When Chef Client performs a Chef run, 
a separate command-line tool called ohai is used to collect system information. 
Ohai exposes this collection of node information to Chef as a set of automatic attributes.


$ ohai | more

{
"network": {
"interfaces": { "lo": {
"mtu": "16436", "flags": [ "LOOPBACK", "UP",
"LOWER_UP" ],
"encapsulation": "Loopback", "addresses": { "127.0.0.1": { "family": "inet", "prefixlen": "8", "netmask": "255.0.0.0", "scope": "Node"
}, ... --More--


• node[:virtualization][:system]
• node['virtualization']['system']	# most use case to get Ohai values . Values are in MASH
• node.virtualization.system






