Import-Module Microsoft.Online.SharePoint.PowerShell
Install-Module Microsoft.Online.SharePoint.PowerShell
Connect-SPOService -url https://spmb05-admin.sharepoint.com

Install-Module SharePointPnPPowerShellOnline
Connect-PnPOnline -Url https://spmb05.sharepoint.com

Get-PnPList
Add-PnPListItem -List "NTR" -Values @{"Title" = "Testiramo iz Powershell"}

Disconnect-PnPOnline
Disconnect-SPOService