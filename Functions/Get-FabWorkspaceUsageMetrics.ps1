
function Get-FabWorkspaceUsageMetrics {
    [Alias("Get-PowerBIWorkspaceUsageMetrics","Get-FabricWorkspaceUsageMetrics")]
    param(
        [Parameter(Mandatory = $true)]
        [string]$workspaceId,
        [Parameter(Mandatory = $true)]
        [string]$username
    )
    $token = (Get-PowerBIAccessToken)["Authorization"]
    $datasetId = New-FabWorkspaceUsageMetrics -workspaceId $workspaceId
    #sleep 10
    $reportnames = @("'Workspace views'", "'Report pages'", "Users", "Reports", "'Report views'", "'Report page views'", "'Report load times'")
    $reports = @{}
    foreach ($reportname in $reportnames) {
        $report = Get-PowerBIUsagemetricsQuery -DatasetID $datasetId -groupId $workspaceId -reportname $reportname -token $token -username $username
        $reports += @{ $reportname.replace("'","") = $report }
    }

    return $reports


}
