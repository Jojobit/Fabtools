
# Path: FabTools/Functions/Remove-FabGroup.ps1

function Remove-FabWorkspace  {
    [Alias("Remove-PowerBIGroup", "Remove-PowerBIWorkspace","Remove-FabGroup","Remove-FabricWorkspace","Remove-FabricGroup")]
    Param (
        [Parameter(Mandatory=$true)]
        [string]$groupID
    )
    $token = (Get-PowerBIAccessToken)["Authorization"]
    return Invoke-RestMethod -uri "https://api.powerbi.com/v1.0/myorg/groups/$groupID" -Headers @{ "Authorization" = $token } -Method Delete

}
