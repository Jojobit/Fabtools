

function Assign-FabWorkspaceToCapacity {
    [Alias("Assign-PowerBIWorkspaceToCapacity", "Assign-PowerBIGroupToCapacity", "Assign-FabGroupToCapacity", "Assign-FabricWorkspaceToCapacity")]
    param(
        [Parameter(Mandatory=$true, ParameterSetName='WorkspaceId')]
        [string]$WorkspaceId,
        [Parameter(Mandatory=$true, ParameterSetName='WorkspaceObject', ValueFromPipeline=$true)]
        $Workspace,
        [Parameter(Mandatory=$true)]
        [string]$CapacityId
    )
    
    if ($PSCmdlet.ParameterSetName -eq 'WorkspaceObject') {
        $workspaceid = $workspace.id
    }
    $body = @{
        "capacityId" = $CapacityId
    } | ConvertTo-Json

    $token = (Get-PowerBIAccessToken)["Authorization"]
    return (Invoke-RestMethod -uri "https://api.powerbi.com/v1.0/myorg/groups/$workspaceID/AssignToCapacity" -Headers @{ "Authorization" = $token } -Method POST -Body $body).value

}