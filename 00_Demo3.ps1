Install-Module ExchangeOnlineManagement
Connect-ExchangeOnline

(Get-Mailbox | Select-Object *)[0]
(Get-ExoMailbox | Select-Object *)[0]

Get-OrganizationConfig | Format-Table Name,OAuth* -Auto

Get-InboxRule -Mailbox simon