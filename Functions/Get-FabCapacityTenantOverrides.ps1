
function Get-FabCapacityTenantOverrides  {
    [Alias("Get-PowerBICapacityTenantOverrides","Get-FabricCapacityTenantOverrides")]
    $token = (Get-PowerBIAccessToken)["Authorization"]
    return Invoke-RestMethod -uri "https://api.fabric.microsoft.com/v1/admin/capacities/delegatedTenantSettingOverrides" -Headers @{ "Authorization" = $token } -Method GET
}