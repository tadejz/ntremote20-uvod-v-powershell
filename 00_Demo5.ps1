Import-Module MicrosoftTeams
Connect-MicrosoftTeams

$teams = Get-Team | Sort-Object -Property DisplayName -Descending

$teams | ForEach-Object {
    $groupId = $_.GroupId
    $displayName = $_.DisplayName

    $channels = Get-TeamChannel -GroupId $groupId

    Add-TeamUser -GroupId $groupId -User $userUPN
}