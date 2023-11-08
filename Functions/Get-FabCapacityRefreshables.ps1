<#
.SYNOPSIS
Retrieves the top refreshable capacities for the tenant.

.DESCRIPTION
The Get-FabCapacityRefreshables function retrieves the top refreshable capacities for the tenant. It supports multiple aliases for flexibility.

.PARAMETER top
The number of top refreshable capacities to retrieve. This is a mandatory parameter.

.EXAMPLE
Get-FabCapacityRefreshables -top 5

This example retrieves the top 5 refreshable capacities for the tenant.

.NOTES
The function retrieves the PowerBI access token and makes a GET request to the PowerBI API to retrieve the top refreshable capacities. It then returns the 'value' property of the response, which contains the capacities.
#>

# This function retrieves the top refreshable capacities for the tenant.
function Get-FabCapacityRefreshables  {
    # Define aliases for the function for flexibility.
    [Alias("Get-PowerBICapacityRefreshables","Get-FabricCapacityRefreshables")]

    # Define a mandatory parameter for the number of top refreshable capacities to retrieve.
    Param (
        [Parameter(Mandatory=$false)]
        [string]$top = 5
    )

    # Retrieve the PowerBI access token.
    $token = (Get-PowerBIAccessToken)["Authorization"]

    # Make a GET request to the PowerBI API to retrieve the top refreshable capacities.
    # The function returns the 'value' property of the response.
    return (Invoke-RestMethod -uri "https://api.powerbi.com/v1.0/myorg/capacities/refreshables?`$top=$top" -Headers @{ "Authorization" = $token } -Method GET).value
}