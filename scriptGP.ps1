# (Optional) Configure Group Policy

Install-WindowsFeature GPMC

# Check if the GroupPolicy module is installed
if (!(Get-Module -Name GroupPolicy -ListAvailable)) {
  # Install the GroupPolicy module if it is not already installed
  Install-Module -Name GroupPolicy
}

# Import the GroupPolicy module
Import-Module GroupPolicy

# Create a new Group Policy object (GPO)
New-GPO -Name "Test-GPO"
