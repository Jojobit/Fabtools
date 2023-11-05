# Module script (.psm1) for Fabtools

# Import all the functions from the Functions folder
$functions = Get-ChildItem -Path "$PSScriptRoot\Functions" -Filter *.ps1
foreach ($function in $functions) {
    . $function.fullname
    Export-ModuleMember -Function $function.basename
}

Set-Alias -Name Login-Fabric -Value Login-PowerBI
Set-Alias -Name Get-FabWorkspace -Value Get-PowerBIWorkspace
Set-Alias -Name Get-FabDataset -Value Get-PowerBIDataset
Set-Alias -Name Get-FabReport -Value Get-PowerBIReport
Set-Alias -Name Add-FabGroupUser -Value Add-PowerBIGroupUser
Set-Alias -Name Remove-FabGroupUser -Value Remove-PowerBIGroupUser
Set-Alias -Name Get-FabGroup -Value Get-PowerBIGroup
Set-Alias -Name Logout-Fabric -Value Logout-PowerBI
Set-Alias -Name New-FabGroup -Value New-PowerBIGroup
Set-Alias -Name New-FabWorkspace -Value New-PowerBIWorkspace