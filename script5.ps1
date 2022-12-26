# Installation of Active Directory services

$DomainName = "elchin.local"

# Step 1. Install the AD-Domain-Services
Install-WindowsFeature AD-Domain-Services

# Step 2. Create forest
Install-ADDSForest -DomainName $DomainName -InstallDNS
