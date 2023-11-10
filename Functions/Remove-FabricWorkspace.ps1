<#
.SYNOPSIS
Removes a workspace.

.DESCRIPTION
The Remove-FabricWorkspace function removes a workspace. It supports multiple aliases for flexibility.

.PARAMETER groupID
The ID of the group (workspace). This is a mandatory parameter.

.EXAMPLE
Remove-FabricWorkspace -groupID "your-group-id"

This example removes a workspace given the group ID.

.NOTES
The function retrieves the PowerBI access token and makes a DELETE request to the PowerBI API to remove the workspace.
#>

# This function removes a workspace.
function Remove-FabricWorkspace {
    [CmdletBinding(SupportsShouldProcess)]
    # Define aliases for the function for flexibility.
    [Alias("Remove-PowerBIGroup", "Remove-PowerBIWorkspace", "Remove-FabGroup", "Remove-FabWorkspace", "Remove-FabricGroup")]

    # Define a parameter for the group ID.
    Param (
        [Parameter(Mandatory = $true)]
        [string]$workspaceID
    )

    # Retrieve the PowerBI access token.
    $token = (Get-PowerBIAccessToken)["Authorization"]

    # Make a DELETE request to the PowerBI API to remove the workspace.
    if ($PSCmdlet.ShouldProcess("Remove workspace $workspaceID")) {
        return Invoke-RestMethod -uri "https://api.powerbi.com/v1.0/myorg/groups/$workspaceID" -Headers @{ "Authorization" = $token } -Method Delete
    }
}