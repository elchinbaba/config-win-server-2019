# Configuration of the network interfaces

$InternalIPAddress = "192.168.2.16"
$InternalCIDR = "24"

# Step 1. Have a look at the information regarding network interfaces
Get-NetIPConfiguration

# Step 2. Change the name of "Ethernet" adapter
Rename-NetAdapter -Name "Ethernet" -NewName "Internal"

# Step 3. Change the name of "Ethernet 2" adapter
Rename-NetAdapter -Name "Ethernet 2" -NewName "External"

# Step 4. Change the IP address of "Internal" adapter
New-NetIPAddress -InterfaceAlias "Internal" -IPAddress $InternalIPAddress -PrefixLength $InternalCIDR

# Step 5. Show the DNS-servers
Set-DnsClientServerAddress -InterfaceAlias "Internal" -ServerAddresses $InternalIPAddress

# Step 6. Check the current configuration
Get-NetIPConfiguration

# Step 7. Activate the firewall rule
Enable-NetFirewallRule -DisplayName "File and Printer Sharing (Echo Request - ICMPv4-IN)"

# Step 8. Test the connection
Test-NetConnection
