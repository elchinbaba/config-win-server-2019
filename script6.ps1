# Configuration of DNS

$NetworkID = "192.168.2.0/24"
$ZoneFile = "2.168.192.in-addr.arpa"

# Step 1. Check the installation of DNS
Get-WindowsFeature DNS

# Step 2. Create configurations for primary zone
Add-DnsServerPrimaryZone -NetworkID $NetworkID -ZoneFile $ZoneFile

# Step 3. Test the DNS server work
Test-DnsServer -IPAddress "192.168.2.16" -ZoneName "elchin.local"
