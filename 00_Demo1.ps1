$procesi = Get-Process
Write-Output $procesi

Write-Output "Vaše uporabniško ime je $env:USERNAME."

Get-Process | Out-GridView
Get-Process | Where-Object { $_.Id -gt 10000 }

$pogoj = $true
if ( $pogoj )
{
    Write-Output "Vrednost spremenljivke `$Pogoj je $Pogoj."
}
else
{
    Write-Output "Vrednost spremenljivke `$Pogoj je $Pogoj."
}

$procesi | ForEach-Object {
    $_
}

Remove-Variable procesi