# Power BI Workspace Usage Metrics

This repository contains PowerShell scripts for retrieving usage metrics data from Power BI workspaces. You can use these functions to gather insights into the usage patterns of your Power BI workspaces, including metrics such as workspace views, report views, and more.

## Prerequisites

Before using these scripts, make sure you have the following prerequisites:

- **Power BI Account**: You need to have a valid Power BI account with the necessary permissions to access the workspaces and datasets you want to collect usage metrics for.

- **PowerShell**: Ensure that you have PowerShell installed on your system. These scripts are designed to run in a PowerShell environment.

## Installation

1. Clone or download this repository to your local machine.

2. Open PowerShell and navigate to the directory where you saved the repository.

3. Run the following command to load the functions:

   ```powershell
   .\PowerBI-UsageMetrics.ps1
   ```

## Usage

### 1. Get Cluster URI

Use the `Get-PowerBIAPIclusterURI` function to retrieve the cluster URI for your Power BI tenant. This URI is required for subsequent API calls.

```powershell
$clusterURI = Get-PowerBIAPIclusterURI
```

### 2. Retrieve Workspace Usage Metrics

To collect usage metrics for a specific Power BI workspace, use the `Get-PowerBIWorkspaceUsageMetrics` function. You will need the `workspaceId` and a valid user `username` with access to the workspace.

```powershell
$workspaceId = "your_workspace_id"
$username = "your_username"
$usageMetrics = Get-PowerBIWorkspaceUsageMetrics -workspaceId $workspaceId -username $username
```

The function retrieves various usage metrics, including workspace views, report views, and more, and returns them as a PowerShell hashtable.

### 3. Export Metrics to CSV

To export specific metrics to a CSV file, you can use the following code as an example:

```powershell
# Example: Export workspace views to CSV
$workspaceViews = $usageMetrics.'Workspace views'.results.tables.rows
$workspaceViews | Export-Csv -Path "workspaceviews.csv" -Append -NoTypeInformation
```

Replace `'Workspace views'` with the metric name you want to export, and specify the desired CSV file path.

### 4. Loop Through Multiple Workspaces

To collect usage metrics for multiple Power BI workspaces, you can use a loop as shown below:

```powershell
$allReports = @()
$workspaces = Get-PowerBIWorkspace

foreach ($workspace in $workspaces) {
    $usageMetrics = Get-PowerBIWorkspaceUsageMetrics -workspaceId $workspace.id -username "your_username"
    $allReports += $usageMetrics
}
```

## Disclaimer

These scripts are provided as-is, and their usage may require adjustments to fit your specific requirements and environment. Ensure that you have the necessary permissions and follow best practices when working with APIs and sensitive data.

## License

This project is licensed under the [MIT License](LICENSE).

---

**Note**: Please make sure to replace `"your_workspace_id"` and `"your_username"` with your actual Power BI workspace ID and username before running the scripts.