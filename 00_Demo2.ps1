Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

Connect-MSOLService
Connect-AzureAD

Get-MsolAccountSku

Get-MsolRole
Add-MsolRoleMember -RoleMemberEmailAddress userPrincipalName -RoleName "Company Administrator"
Get-MsolUserRole -UserPrincipalName administrator@spmb05.onmicrosoft.com

Get-MsolUser | Out-GridView

Set-MsolUserPrincipalName -UserPrincipalName $UserPrincipalName -NewUserPrincipalName $tempUPN

Set-MsolUser -UserPrincipalName -PreferredLanguage "SL"

New-MsolUser -DisplayName "Janez NT Remote" -UserPrincipalName "janez.ntremote@oblak365.si"

$licensesToAdd = @("ntremote:POWER_BI_STANDARD","ntremote:POWER_BI_STANDARD")
Set-MsolUser -UserPrincipalName janez.ntremote@oblak365.si -UsageLocation "SI"
Set-MsolUserLicense -UserPrincipalName janez.ntremote@oblak365.si -AddLicenses "spmb05:STANDARDWOFFPACK_FACULTY"