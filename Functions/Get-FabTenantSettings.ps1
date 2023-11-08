<#
.SYNOPSIS
Retrieves the tenant settings.

.DESCRIPTION
The Get-FabTenantSettings function retrieves the tenant settings. It supports multiple aliases for flexibility.

.EXAMPLE
Get-FabTenantSettings

This example retrieves the tenant settings.

.NOTES
The function retrieves the PowerBI access token and makes a GET request to the Fabric API to retrieve the tenant settings. It then returns the 'tenantSettings' property of the first item in the response.
#>

# This function retrieves the tenant settings.
function Get-FabTenantSettings  {
    # Define aliases for the function for flexibility.
    [Alias("Get-PowerBITenantSettings","Get-FabricTenantSettings")]

    # Retrieve the PowerBI access token.
    $token = (Get-PowerBIAccessToken)["Authorization"]

    # Make a GET request to the Fabric API to retrieve the tenant settings.
    $reply = Invoke-RestMethod -uri "https://api.fabric.microsoft.com/v1/admin/tenantsettings" -Headers @{ "Authorization" = $token } -Method GET

    # Return the 'tenantSettings' property of the first item in the response.
    return $reply[0].tenantSettings
}