<#
.SYNOPSIS
This script is the module script (.psm1) for Fabtools.

.DESCRIPTION
The script imports all the functions from the Functions folder and exports them as module members. It also sets aliases for several PowerBI functions.

.NOTES
The script uses the Get-ChildItem cmdlet to retrieve all the .ps1 files in the Functions folder. It then uses a foreach loop to dot-source each function and export it as a module member. The script also uses the Set-Alias cmdlet to set aliases for several PowerBI functions.

.EXAMPLE
To use this script, you can import the module using the Import-Module cmdlet:

```powershell
Import-Module ./FabTools.psm1
```
#>

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
