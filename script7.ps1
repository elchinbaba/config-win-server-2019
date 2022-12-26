# Configuration of DHCP for Active Directory

$ScopeId = "192.168.2.0"
$DnsDomain = "elchin.local"
$DnsServer = "192.168.2.16"
$Router = "192.168.2.16"

$IpAddress = "192.168.2.16"

# Step 1. Change DNS server for DHCP scope
Set-DHCPServerv4OptionValue -ScopeId $ScopeId -DnsDomain $DnsDomain -DnsServer $DnsServer -Router $Router

# Step 2. Authorize DHCP server in Active Directory
Add-DHCPServerInDC -DnsName $DnsDomain -IpAddress $IpAddress

# Step 3. Restart DHCP server
Restart-Service dhcpserver

# Step 4. Have a look at the configurations of the DHCP server scope
Get-DhcpServerv4Scope

# Step 5. Have a look at the DHCP servers that have been authorized in Active Directory
Get-DHCPServerInDC
