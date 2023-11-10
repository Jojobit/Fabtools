<#
.SYNOPSIS
   This script loads necessary modules, sources functions from .ps1 files, and sets aliases for PowerBI functions.

.DESCRIPTION
   The script first tries to load the Az.Accounts and Az.Resources modules. If these modules are not available, it installs and imports them.
   It then gets all .ps1 files in the Functions folder, sources each function, and exports it as a module member.
   Finally, it sets an alias for the PowerBI login function.

.EXAMPLE
   .\Fabtools.psm1

   This command runs the script.

.INPUTS
   None. You cannot pipe inputs to this script.

.OUTPUTS
   None. This script does not return any output.

.NOTES
   This script is part of the Fabtools module.
#>

# Try to load necessary modules
try {
    # Check if Az.Accounts module is available
    if (get-module -ListAvailable -name Az.Accounts) {
        # Import Az.Accounts module
        Import-Module Az.Accounts -erroraction silentlycontinue
        write-information "Az.Accounts module is loaded"
    }
    else {
        write-information "Az.Accounts module is not loaded. Loading it now..."
        # Install and import Az.Accounts module
        install-module -name Az.Accounts -force -scope allusers
        Import-Module Az.Accounts -erroraction silentlycontinue
    }
    # Check if Az.Resources module is available
    if (get-module -ListAvailable -name Az.Resources) {
        # Import Az.Resources module
        Import-Module Az.Resources -erroraction silentlycontinue
        write-information "Az.Resources module is loaded"
    }
    else {
        write-information "Az.Resources module is not loaded. Loading it now..."
        # Install and import Az.Resources module
        install-module -name Az.Resources -force -scope allusers
        Import-Module Az.Resources -erroraction silentlycontinue
    }
}
catch {
    # Handle any exceptions that occur during module loading
    write-information "Looks like the assemblies are allready loaded"
}

# Get all .ps1 files in the Functions folder
$functions = Get-ChildItem -Path "$PSScriptRoot\Functions" -Filter *.ps1

# Loop over each function file
foreach ($function in $functions) {
    # Dot-source the function
    . $function.fullname
    # Export the function as a module member
    Export-ModuleMember -Function $function.basename
}

# Set aliases for PowerBI functions
Set-Alias -Name Login-Fabric -Value Login-PowerBI
Export-ModuleMember -Alias Login-Fabric
Set-Alias -Name Get-FabWorkspace -Value Get-PowerBIWorkspace
Export-ModuleMember -Alias Get-FabWorkspace
Set-Alias -Name Get-FabricWorkspace -Value Get-PowerBIWorkspace
Export-ModuleMember -Alias Get-FabricWorkspace
Set-Alias -Name Get-FabDataset -Value Get-PowerBIDataset
Export-ModuleMember -Alias Get-FabDataset
Set-Alias -Name Get-FabricDataset -Value Get-PowerBIDataset
Export-ModuleMember -Alias Get-FabricDataset
Set-Alias -Name Get-FabReport -Value Get-PowerBIReport
Export-ModuleMember -Alias Get-FabReport
Set-Alias -Name Get-FabricReport -Value Get-PowerBIReport
Export-ModuleMember -Alias Get-FabricReport
Set-Alias -Name Add-FabGroupUser -Value Add-PowerBIGroupUser
Export-ModuleMember -Alias Add-FabGroupUser
Set-Alias -Name Add-FabricGroupUser -Value Add-PowerBIGroupUser
Export-ModuleMember -Alias Add-FabricGroupUser
Set-Alias -Name Remove-FabGroupUser -Value Remove-PowerBIGroupUser
Export-ModuleMember -Alias Remove-FabGroupUser
Set-Alias -Name Remove-FabricGroupUser -Value Remove-PowerBIGroupUser
Export-ModuleMember -Alias Remove-FabricGroupUser
Set-Alias -Name Get-FabGroup -Value Get-PowerBIGroup
Export-ModuleMember -Alias Get-FabGroup
Set-Alias -Name Get-FabricGroup -Value Get-PowerBIGroup
Export-ModuleMember -Alias Get-FabricGroup
Set-Alias -Name Logout-Fabric -Value Logout-PowerBI
Export-ModuleMember -Alias Logout-Fabric
Set-Alias -Name New-FabGroup -Value New-PowerBIGroup
Export-ModuleMember -Alias New-FabGroup
Set-Alias -Name New-FabricGroup -Value New-PowerBIGroup
Export-ModuleMember -Alias New-FabricGroup
Set-Alias -Name New-FabWorkspace -Value New-PowerBIWorkspace
Export-ModuleMember -Alias New-FabWorkspace
Set-Alias -Name New-FabricWorkspace -Value New-PowerBIWorkspace
Export-ModuleMember -Alias New-FabricWorkspace
Set-Alias -Name Get-FabCapacity -Value Get-PowerBICapacity
Export-ModuleMember -Alias Get-FabCapacity
Set-Alias -Name Get-FabricCapacity -Value Get-PowerBICapacity
Export-ModuleMember -Alias Get-FabricCapacity