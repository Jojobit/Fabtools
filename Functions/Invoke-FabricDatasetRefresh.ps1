<#
.SYNOPSIS
    This function invokes a refresh of a PowerBI dataset in a specific workspace.

.DESCRIPTION
    The Invoke-FabricDatasetRefresh function is used to refresh a PowerBI dataset. It first checks if the dataset is refreshable. If it is not, it writes an error. If it is, it invokes a PowerBI REST method to refresh the dataset. The URL for the request is constructed using the provided workspace ID and dataset ID.

.PARAMETER WorkspaceId
    A mandatory parameter that specifies the workspace ID.

.PARAMETER DatasetID
    A mandatory parameter that specifies the dataset ID.

.EXAMPLE
    Invoke-FabricDatasetRefresh -WorkspaceId "12345678-1234-1234-1234-123456789012" -DatasetID "12345678-1234-1234-1234-123456789012"

    This command invokes a refresh of the dataset with the ID "12345678-1234-1234-1234-123456789012" in the workspace with the ID "12345678-1234-1234-1234-123456789012".

.NOTES
    Alias: Invoke-PowerBIDatasetRefresh, Invoke-FabDatasetRefresh
#>
function Invoke-FabricDatasetRefresh {
    # Define aliases for the function for flexibility.
    [Alias("Invoke-PowerBIDatasetRefresh", "Invoke-FabDatasetRefresh")]

    # Define parameters for the workspace ID and dataset ID.
    param(
        # Mandatory parameter for the workspace ID
        [Parameter(Mandatory = $true, ParameterSetName = 'WorkspaceId')]
        [string]$WorkspaceId,

        # Mandatory parameter for the dataset ID
        [Parameter(Mandatory = $true, ParameterSetName = "DatasetId")]
        [string]$DatasetID
    )

    # Check if the dataset is refreshable
    if ((Get-FabricDataset -WorkspaceId $WorkspaceId -DatasetId $DatasetID).isrefreshable -eq $false) {
        # If the dataset is not refreshable, write an error
        Write-error "Dataset is not refreshable"
    } else {
        # If the dataset is refreshable, invoke a PowerBI REST method to refresh the dataset
        # The URL for the request is constructed using the provided workspace ID and dataset ID.
        return Invoke-PowerBIRestMethod -Method Post -Url ("groups/" + $WorkspaceID + "/datasets/" + $DatasetId + "/refreshes")
    }
}