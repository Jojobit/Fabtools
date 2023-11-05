
function Get-FabDatasetRefreshes {
    [Alias("Get-PowerBIDatasetRefreshes","Get-FabricDatasetRefreshes")]
    #parameter declarations, all parameters are mandatory
    param(
        [Parameter(Mandatory=$true)]
        [string]$DatasetID
    )
    $di = get-powerbidataset -id $DatasetID
    if ($di.isrefreshable ) {
        # Get a list of all the refreshes for the dataset
        $results = (Invoke-PowerBIRestMethod -Method get -Url ("datasets/" + $di.id + "/Refreshes") | ConvertFrom-Json) 
        # Selecting the most recent refresh
        $results.value[0] 
        # Create a PSCustomObject with the information about the refresh
        $refresh = [PSCustomObject]@{
            Clock        = Get-Date
            Workspace    = $w.name
            Dataset      = $di.Name
            refreshtype  = $results.value[0].refreshType
            startTime    = $results.value[0].startTime
            endTime      = $results.value[0].endTime
            status       = $results.value[0].status
            ErrorMessage = $results.value[0].serviceExceptionJson   
        }
        return $refresh

    }

    return $null

}