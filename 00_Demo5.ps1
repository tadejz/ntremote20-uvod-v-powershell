Import-Module MicrosoftTeams
Connect-MicrosoftTeams

$teams = Get-Team | Sort-Object -Property DisplayName

$teams[0] | ForEach-Object {
    #$_.GroupId
    $_.DisplayName

    $channels = Get-TeamChannel -GroupId "6ed26973-dc4e-4053-875c-dcfc8a7f7849"

    Add-TeamUser -GroupId $groupId -User $userUPN
}