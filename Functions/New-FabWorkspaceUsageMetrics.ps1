
# a function to get the workspace usage metrics dataset ID
function New-FabWorkspaceUsageMetrics {
    [Alias("New-PowerBIWorkspaceUsageMetrics","New-FabricWorkspaceUsageMetrics")]
    param(
        [Parameter(Mandatory = $true)]
        [string]$workspaceId
    )
    $token = (Get-PowerBIAccessToken)["Authorization"]
    $url = get-FabAPIclusterURI
    $data = Invoke-WebRequest -Uri "$url/$workspaceId/usageMetricsReportV2?experience=power-bi" -Headers @{ "Authorization" = $token } -ErrorAction SilentlyContinue
    $response = $data.Content.ToString().Replace("nextRefreshTime", "NextRefreshTime").Replace("lastRefreshTime", "LastRefreshTime") | ConvertFrom-Json
    return $response.models[0].dbName
}
  
