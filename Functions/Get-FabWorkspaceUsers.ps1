function Get-FabWorkspaceUsers {
    [Alias("Get-PowerBIWorkspaceUsers","Get-FabricWorkspaceUsers")]
    param(
        [Parameter(Mandatory=$true, ParameterSetName='WorkspaceId')]
        [string]$WorkspaceId,
        
        [Parameter(Mandatory=$true, ParameterSetName='WorkspaceObject', ValueFromPipeline=$true)]
        $Workspace
    )
    
    if ($PSCmdlet.ParameterSetName -eq 'WorkspaceId') {
        $workspace = Get-PowerBIWorkspace -Id $WorkspaceId
    }
    
    return (Invoke-PowerBIRestMethod -Method get -Url ("groups/$($workspace.Id)/users") | ConvertFrom-Json).value
}