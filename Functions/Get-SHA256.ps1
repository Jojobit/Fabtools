function Get-Sha256 ($string) {
    $sha256 = New-Object System.Security.Cryptography.SHA256CryptoServiceProvider
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($string)
    $hash = $sha256.ComputeHash($bytes)
    $result = [System.BitConverter]::ToString($hash) -replace '-'
    return $result
}