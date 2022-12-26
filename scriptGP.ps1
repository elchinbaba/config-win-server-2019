# (Optional) Configure Group Policy
# Check if the GroupPolicy module is installed
if (!(Get-Module -Name GroupPolicy -ListAvailable)) {
  # Install the GroupPolicy module if it is not already installed
  Install-Module -Name GroupPolicy
}

# Import the GroupPolicy module
Import-Module GroupPolicy

# Create a new Group Policy object (GPO)
New-GPO -Name "Default Domain Policy"

# Set the UserAuthenticationRequired property to $true
Set-GPO -Name "Default Domain Policy" -UserAuthenticationRequired $true
