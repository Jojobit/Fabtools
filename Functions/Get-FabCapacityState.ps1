function Get-FabCapacityState {
    [Alias("Get-PowerBICapacityState","Get-FabricCapacityState")]
    Param (
        [Parameter(Mandatory=$true)]
        [string]$subscriptionID,
        [Parameter(Mandatory=$true)]
        [string]$resourcegroupID,
        [Parameter(Mandatory=$true)]
        [string]$capacityID
    )
    
   if ($null -eq $env:azToken) {
        Connect-azaccount
        $env:aztoken = "Bearer "+(get-azAccessToken).Token 
    }
    $headers = @{"Authorization"=$env:aztoken}
    $getCapacityState = "https://management.azure.com/subscriptions/$subscriptionID/resourceGroups/$resourcegroupID/providers/Microsoft.Fabric/capacities/$capacityID?api-version=2023-07-01-preview"
    return Invoke-RestMethod -Method GET -Uri $getCapacityState -Headers $headers -ErrorAction Stop
}