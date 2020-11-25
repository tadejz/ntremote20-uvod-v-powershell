$procesi = Get-Process
Write-Output $procesi

Remove-Variable procesi
Write-Output "Vaše uporabniško ime je $env:USERNAME."

Get-Process | Out-GridView
Get-Process | Where-Object { $_.Id -gt 10000 }