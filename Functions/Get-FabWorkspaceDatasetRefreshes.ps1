

function Get-FabWorkspaceDatasetRefreshes {
    [Alias("Get-PowerBIWorkspaceDatasetRefreshes","Get-FabricWorkspaceDatasetRefreshes")]
    param(
        [Parameter(Mandatory=$true)]
        [string]$WorkspaceID
    )
    $wsp = Get-PowerBIWorkspace -workspaceid $WorkspaceID
    $refs = @()
    $d = Get-PowerBIDataset -workspaceid $wsp.Id 
}