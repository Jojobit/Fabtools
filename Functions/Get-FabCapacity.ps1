
function Get-FabCapacity  {
    [Alias("Get-PowerBICapacity","Get-FabricCapacity")]
    $token = (Get-PowerBIAccessToken)["Authorization"]
    return (Invoke-RestMethod -uri "https://api.powerbi.com/v1.0/myorg/capacities" -Headers @{ "Authorization" = $token } -Method GET).value

}
