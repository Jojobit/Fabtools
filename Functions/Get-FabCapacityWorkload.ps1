<#
.SYNOPSIS
Retrieves the workloads for a specific capacity.

.DESCRIPTION
The Get-FabCapacity function retrieves the workloads for a specific capacity. It supports multiple aliases for flexibility.

.PARAMETER capacityID
The ID of the capacity. This is a mandatory parameter.

.EXAMPLE
Get-FabCapacity -capacityID "your-capacity-id"

This example retrieves the workloads for a specific capacity given the capacity ID.

.NOTES
The function retrieves the PowerBI access token and makes a GET request to the PowerBI API to retrieve the workloads for the specified capacity. It then returns the 'value' property of the response, which contains the workloads.
#>

# This function retrieves the workloads for a specific capacity.
function Get-FabCapacityWorkload  {
    # Define aliases for the function for flexibility.
    [Alias("Get-PowerBICapacityWorkload","Get-FabricCapacityWorkload")]

    # Define a mandatory parameter for the capacity ID.
    Param (
        [Parameter(Mandatory=$true)]
        [string]$capacityID
    )

    # Retrieve the PowerBI access token.
    $token = (Get-PowerBIAccessToken)["Authorization"]

    # Make a GET request to the PowerBI API to retrieve the workloads for the specified capacity.
    # The function returns the 'value' property of the response.
    return (Invoke-RestMethod -uri "https://api.powerbi.com/v1.0/myorg/capacities/$capacityID/Workloads" -Headers @{ "Authorization" = $token } -Method GET).value
}