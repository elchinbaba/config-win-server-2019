# Configuration of NAT

# Step 2. Define remote access type
Install-RemoteAccess -VpnType RoutingOnly -PassThru

# Step 3, 4, 5. Run netsh, Enter the NAT configuration, Install the NAT components
Invoke-Expresson 'netsh routing ip nat install'

# Step 6. Add the "External" interface
Invoke-Expression 'netsh routing ip nat add interface "External" mode=full'

# Step 7. Add the "Internal" interface
Invoke-Expression 'netsh routing ip nat add interface "Internal"'

# Step 8. Exit from netsh
Invoke-Expression 'exit'

# Step 9. Test the connection.
Test-NetConnection
