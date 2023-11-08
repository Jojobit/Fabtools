<#
.SYNOPSIS
Retrieves the cluster URI for the tenant.

.DESCRIPTION
The Get-FabAPIclusterURI function retrieves the cluster URI for the tenant. It supports multiple aliases for flexibility.

.EXAMPLE
Get-FabAPIclusterURI

This example retrieves the cluster URI for the tenant.

.NOTES
The function retrieves the PowerBI access token and makes a GET request to the PowerBI API to retrieve the datasets. It then extracts the '@odata.context' property from the response, splits it on the '/' character, and selects the third element. This element is used to construct the cluster URI, which is then returned by the function.

#>

#This function retrieves the cluster URI for the tenant.


function Get-FabAPIclusterURI  {
    # Define aliases for the function for flexibility.
    [Alias("Get-PowerBIClusterURI","Get-FabricClusterURI")]

    # Retrieve the PowerBI access token.
    $token = (Get-PowerBIAccessToken)["Authorization"]

    # Make a GET request to the PowerBI API to retrieve the datasets.
    $reply = Invoke-RestMethod -uri "https://api.powerbi.com/v1.0/myorg/datasets" -Headers @{ "Authorization" = $token } -Method GET

    # Extract the '@odata.context' property from the response.
    $unaltered = $reply.'@odata.context'

    # Split the '@odata.context' property on the '/' character and select the third element.
    $stripped = $unaltered.split('/')[2]

    # Construct the cluster URI.
    $clusterURI = "https://$stripped/beta/myorg/groups"

    # Return the cluster URI.
    return $clusterURI
}