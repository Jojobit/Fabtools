<#
.SYNOPSIS
Retrieves the tenant overrides for all capacities.

.DESCRIPTION
The Get-FabCapacityTenantOverrides function retrieves the tenant overrides for all capacities. It supports multiple aliases for flexibility.

.EXAMPLE
Get-FabCapacityTenantOverrides

This example retrieves the tenant overrides for all capacities.

.NOTES
The function retrieves the PowerBI access token and makes a GET request to the Fabric API to retrieve the tenant overrides for all capacities. It then returns the response of the GET request.
#>

# This function retrieves the tenant overrides for all capacities.
function Get-FabCapacityTenantOverrides  {
    # Define aliases for the function for flexibility.
    [Alias("Get-PowerBICapacityTenantOverrides","Get-FabricCapacityTenantOverrides")]

    # Retrieve the PowerBI access token.
    $token = (Get-PowerBIAccessToken)["Authorization"]

    # Make a GET request to the Fabric API to retrieve the tenant overrides for all capacities.
    # The function returns the response of the GET request.
    return Invoke-RestMethod -uri "https://api.fabric.microsoft.com/v1/admin/capacities/delegatedTenantSettingOverrides" -Headers @{ "Authorization" = $token } -Method GET
}