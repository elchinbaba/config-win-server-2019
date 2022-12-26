# DHCP installation and configuration

$ScopeName = "elchin.local"
$ScopeStartIP = "192.168.2.50"
$ScopeEndIP = "192.168.2.254"
$ScopeSubnetMask = "255.255.255.0"

$ScopeId = "192.168.2.0"
$DnsServerMain = "192.168.0.1"
$DnsServerGoogle = "8.8.8.8"
$Router = "192.168.2.16"

# Step 1. Show the DHCP component
Install-WindowsFeature DHCP

# Step 2. Create the servers security group
Invoke-Expression 'netsh dhcp add securitygroups'

# Step 3. Restart the DHCP-server
Restart-Service dhcpserver

# Step 4. Creating the DHCP Scope
Add-DHCPServerv4Scope -Name $ScopeName -StartRange $ScopeStartIP -EndRange $ScopeEndIP -SubnetMask $ScopeSubnetMask -State Active

# Step 5. Show the time of lease duration of the IP address
Set-DHCPServerv4Scope -ScopeId $ScopeId -LeaseDuration 0.07:00:00

# Step 6. Show the DNS servers and the router
Set-DHCPServerv4OptionValue -ScopeId $ScopeId -DnsServer $DnsServerMain, $DnsServerGoogle -Router $Router
