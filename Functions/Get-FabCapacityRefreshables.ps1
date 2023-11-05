
function Get-FabCapacityRefreshables  {
    [Alias("Get-PowerBICapacityRefreshables","Get-FabricCapacityRefreshables")]
    Param (
        [Parameter(Mandatory=$true)]
        [string]$top
    )

    $token = (Get-PowerBIAccessToken)["Authorization"]
    return (Invoke-RestMethod -uri "https://api.powerbi.com/v1.0/myorg/capacities/refreshables?`$top=$top" -Headers @{ "Authorization" = $token } -Method GET).value

}