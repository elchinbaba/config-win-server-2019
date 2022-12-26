# Configuration of the computer name and the workgroup

# Step 1. Change the computer name to "OfficeWinServer"
Rename-Computer -NewName "OfficeWinServer"

# Step 2. Change the workgroup name to "Office"
Add-Computer -WorkgroupName "Office"

# Step 3. Restart the server
Restart-Computer
