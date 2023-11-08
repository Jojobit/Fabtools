<#
.SYNOPSIS
Sets a PowerBI workspace to a capacity.

.DESCRIPTION
The Set-FabWorkspaceToCapacity function Sets a PowerBI workspace to a capacity. It supports multiple aliases for flexibility.

.PARAMETER WorkspaceId
The ID of the workspace to be Seted. This is a mandatory parameter.

.PARAMETER Workspace
The workspace object to be Seted. This is a mandatory parameter and can be piped into the function.

.PARAMETER CapacityId
The ID of the capacity to which the workspace will be Seted. This is a mandatory parameter.

.EXAMPLE
Set-FabWorkspaceToCapacity -WorkspaceId "Workspace-GUID" -CapacityId "Capacity-GUID"

This example Sets the workspace with ID "Workspace-GUID" to the capacity with ID "Capacity-GUID".

.EXAMPLE
$workspace | Set-FabWorkspaceToCapacity -CapacityId "Capacity-GUID"

This example Sets the workspace object stored in the $workspace variable to the capacity with ID "Capacity-GUID". The workspace object is piped into the function.

.NOTES
The function makes a POST request to the PowerBI API to Set the workspace to the capacity. The PowerBI access token is retrieved using the Get-PowerBIAccessToken function.
#>


# This function Sets a PowerBI workspace to a capacity.
# It supports multiple aliases for flexibility.
function Set-FabWorkspaceToCapacity {
    [Alias("Set-PowerBIWorkspaceToCapacity", "Set-PowerBIGroupToCapacity", "Set-FabGroupToCapacity", "Set-FabricWorkspaceToCapacity")]
    [CmdletBinding(SupportsShouldProcess)]
    param(
        # WorkspaceId is a mandatory parameter. It represents the ID of the workspace to be Seted.
        [Parameter(Mandatory = $true, ParameterSetName = 'WorkspaceId')]
        [string]$WorkspaceId,

        # Workspace is a mandatory parameter. It represents the workspace object to be Seted.
        # This parameter can be piped into the function.
        [Parameter(Mandatory = $true, ParameterSetName = 'WorkspaceObject', ValueFromPipeline = $true)]
        $Workspace,

        # CapacityId is a mandatory parameter. It represents the ID of the capacity to which the workspace will be Seted.
        [Parameter(Mandatory = $true)]
        [string]$CapacityId
    )
    Process {
        # If the parameter set name is 'WorkspaceObject', the workspace ID is extracted from the workspace object.
        if ($PSCmdlet.ParameterSetName -eq 'WorkspaceObject') {
            $workspaceid = $workspace.id
        }

        # The body of the request is created. It contains the capacity ID.
        $body = @{
            "capacityId" = $CapacityId
        }

        # The PowerBI access token is retrieved.
        $token = (Get-PowerBIAccessToken)["Authorization"]

        # The workspace is Seted to the capacity by making a POST request to the PowerBI API.
        # The function returns the value property of the response.
        if ($PSCmdlet.ShouldProcess("Set workspace $workspaceid to capacity $CapacityId")) {
            return (Invoke-RestMethod -uri "https://api.powerbi.com/v1.0/myorg/groups/$workspaceid/AssignToCapacity" -Headers @{ "Authorization" = $token } -Method POST -Body $body).value
        }
   }
}