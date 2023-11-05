function Suspend-FabCapacity {
    [Alias("Suspend-PowerBICapacity","Suspend-FabricCapacity")]
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
    $suspendCapacity = "https://management.azure.com/subscriptions/$subscriptionID/resourceGroups/$resourcegroupID/providers/Microsoft.Fabric/capacities/$capacityID/suspend?api-version=2023-07-01-preview"
    return Invoke-RestMethod -Method GET -Uri $suspendCapacity -Headers $headers -ErrorAction Stop
}