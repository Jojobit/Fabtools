
function Get-FabUsageMetricsQuery {
    [Alias("Get-PowerBIUsageMetricsQuery","Get-FabricUsageMetricsQuery")]
    param (
        [Parameter(Mandatory = $true)]
        [string]$DatasetID,
        [Parameter(Mandatory = $true)]
        [string]$groupId,
        [Parameter(Mandatory = $true)]
        $reportname,
        [Parameter(Mandatory = $true)]
        [string]$token,
        [Parameter(Mandatory = $false)]
        [string]$ImpersonatedUser = ""
    )
    $headers = @{ 
        "Authorization" = $token
        "Content-Type"  = "application/json"
  
    }
    $reportbody = '{
        "queries": [
          {
            "query": "EVALUATE VALUES(' + $reportname + ')"
          }
        ],
        "serializerSettings": {
          "includeNulls": true
        },
        "impersonatedUserName": "'+ $ImpersonatedUser + '"
      }'
    
    return Invoke-RestMethod -uri "https://api.powerbi.com/v1.0/myorg/groups/$groupId/datasets/$DatasetID/executeQueries" -Headers $headers -Body $reportbody -Method Post
}