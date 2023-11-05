
function Get-FabCapacity  {
    [Alias("Get-PowerBICapacity","Get-FabricCapacity")]
    Param (
        [Parameter(Mandatory=$true)]
        [string]$capacityID
    )
    $token = (Get-PowerBIAccessToken)["Authorization"]
    return (Invoke-RestMethod -uri "https://api.powerbi.com/v1.0/myorg/capacities/$capacityID/Workloads" -Headers @{ "Authorization" = $token } -Method GET).value

}
