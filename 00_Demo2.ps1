Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

Connect-MSOLService
Connect-AzureAD

Get-MsolAccountSku

Get-MsolRole
Add-MsolRoleMember -RoleMemberEmailAddress userPrincipalName -RoleName "Company Administrator"
Get-MsolUserRole -UserPrincipalName administrator@spmb05.onmicrosoft.com

Get-MsolUser | Out-GridView
Set-MsolUserPrincipalName -UserPrincipalName $UserPrincipalName -NewUserPrincipalName $tempUPN
Set-MsolUser -UserPrincipalName

New-MsolUser 
$licensesToAdd = @("ntremote:POWER_BI_STANDARD","ntremote:POWER_BI_STANDARD")
Set-MsolUserLicense -UserPrincipalName "janez.ntremote@oblak365.si" -AddLicenses $licensesToAdd