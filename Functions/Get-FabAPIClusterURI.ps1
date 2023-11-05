# a function to get the cluster URI for the tenant
function Get-FabAPIclusterURI  {
    [Alias("Get-PowerBIClusterURI","Get-FabricClusterURI")]
    $token = (Get-PowerBIAccessToken)["Authorization"]
    $reply = Invoke-RestMethod -uri "https://api.powerbi.com/v1.0/myorg/datasets" -Headers @{ "Authorization" = $token } -Method GET
    $unaltered = $reply.'@odata.context'
    $stripped = $unaltered.split('/')[2]
    $clusterURI = "https://$stripped/beta/myorg/groups"
    return $clusterURI
}
