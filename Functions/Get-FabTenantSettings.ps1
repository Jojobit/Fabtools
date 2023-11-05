function Get-FabTenantSettings  {
    [Alias("Get-PowerBITenantSettings","Get-FabricTenantSettings")]
    $token = (Get-PowerBIAccessToken)["Authorization"]
    $reply = Invoke-RestMethod -uri "https://api.fabric.microsoft.com/v1/admin/tenantsettings" -Headers @{ "Authorization" = $token } -Method GET
    return $reply[0].tenantSettings
}