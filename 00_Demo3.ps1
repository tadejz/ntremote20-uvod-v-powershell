Install-Module ExchangeOnlineManagement
Connect-ExchangeOnline

(Get-Mailbox | Select-Object *)[0]
(Get-ExoMailbox | Select-Object *)[0]

Get-OrganizationConfig | Format-Table Name,OAuth* -Auto
Set-OrganizationConfig -OAuth2ClientProfileEnabled $true

$rule = Get-InboxRule -Mailbox simon