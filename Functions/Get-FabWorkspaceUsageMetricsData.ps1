<#
.SYNOPSIS
Retrieves workspace usage metrics data.

.DESCRIPTION
The Get-FabWorkspaceUsageMetricsData function retrieves workspace usage metrics. It supports multiple aliases for flexibility.

.PARAMETER workspaceId
The ID of the workspace. This is a mandatory parameter.

.PARAMETER username
The username. This is a mandatory parameter.

.EXAMPLE
Get-FabWorkspaceUsageMetricsData -workspaceId "your-workspace-id" -username "your-username"

This example retrieves the workspace usage metrics for a specific workspace given the workspace ID and username.

.NOTES
The function retrieves the PowerBI access token and creates a new usage metrics report. It then defines the names of the reports to retrieve, initializes an empty hashtable to store the reports, and for each report name, retrieves the report and adds it to the hashtable. It then returns the hashtable of reports.
#>

# This function retrieves workspace usage metrics.
function Get-FabWorkspaceUsageMetricsData {
    # Define aliases for the function for flexibility.
    [Alias("Get-PowerBIWorkspaceUsageMetricsData", "Get-FabricWorkspaceUsageMetricsData")]

    # Define parameters for the workspace ID and username.
    param(
        [Parameter(Mandatory = $true)]
        [string]$workspaceId,
        [Parameter(Mandatory = $false)]
        [string]$username = ""
    )

    # Retrieve the PowerBI access token.
    $token = (Get-PowerBIAccessToken)["Authorization"]

    # Create a new workspace usage metrics dataset.
    $datasetId = New-FabWorkspaceUsageMetricsReport -workspaceId $workspaceId

    # Define the names of the reports to retrieve.
    $reportnames = @("'Workspace views'", "'Report pages'", "Users", "Reports", "'Report views'", "'Report page views'", "'Report load times'")

    # Initialize an empty hashtable to store the reports.
    $reports = @{}

    # For each report name, retrieve the report and add it to the hashtable.
    if ($username -eq "") {
        foreach ($reportname in $reportnames) {
            $report = Get-PowerBIUsagemetricsQuery -DatasetID $datasetId -groupId $workspaceId -reportname $reportname -token $token
            $reports += @{ $reportname.replace("'", "") = $report }
        }
    }
    else {
        foreach ($reportname in $reportnames) {
            $report = Get-PowerBIUsagemetricsQuery -DatasetID $datasetId -groupId $workspaceId -reportname $reportname -token $token -ImpersonatedUser $username
            $reports += @{ $reportname.replace("'", "") = $report }
        }
    }
    # Return the hashtable of reports.
    return $reports
}