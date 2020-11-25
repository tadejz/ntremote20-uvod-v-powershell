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

$procesi[0] | ForEach-Object {
    #$_.Id
    $_
}

Remove-Variable procesi

Get-ChildItem # Modify [CmdletBinding()] to [CmdletBinding(SupportsShouldProcess=$true)]
$paths = @()
foreach ($aPath in $Path) {
    if (!(Test-Path -LiteralPath $aPath)) {
        $ex = New-Object System.Management.Automation.ItemNotFoundException "Cannot find path '$aPath' because it does not exist."
        $category = [System.Management.Automation.ErrorCategory]::ObjectNotFound
        $errRecord = New-Object System.Management.Automation.ErrorRecord $ex,'PathNotFound',$category,$aPath
        $psCmdlet.WriteError($errRecord)
        continue
    }

    # Resolve any relative paths
    $paths += $psCmdlet.SessionState.Path.GetUnresolvedProviderPathFromPSPath($aPath)
}

Start-Transcript

Stop-Transcript