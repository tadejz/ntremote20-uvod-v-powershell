<#
    Moduli za upravljanje Microsoft 365 s Powershell omogočajo interakcijo s posameznimi 
    storitvami. Modul je najprej treba namestiti, nato pa uvoziti.

    Funkcijo Load-Module sem pripravil tako, da si delo z nameščanjem in uvažanjem nekoliko
    poenostavim.
#>

Function Load-Module () {
    param (
        [Parameter(Mandatory=$true)][string]$Module, # Ime modula
        [Parameter(Mandatory=$false)][switch]$Debug # Če je $true ne izvede EXIT, 1
    )

    # Če je modul že uvožen, obvesti uporabnika
    if (Get-Module | Where-Object {$_.Name -eq $Module}) {
        write-host "Modul $Module je že uvožen."
    }
    else {

        # Če modul ni uvožen, a je na voljo na disku, ga uvozi
        if (Get-Module -ListAvailable | Where-Object {$_.Name -eq $Module}) {
            Import-Module $Module -Verbose
        }
        else {

            # Če modul ni uvožen, niti ga ni na disku, a je na voljo v spletni galeriji, ga namesti in uvozi
            if (Find-Module -Name $Module | Where-Object {$_.Name -eq $Module}) {
                Install-Module -Name $Module -Force -Verbose -Scope CurrentUser
                Import-Module $Module -Verbose
            }
            else {

                # Modula ni nikjer. Sorry.
                write-host "Modul $Module ni na voljo, zaključujem."
                if ( $Debug )
                {
                    EXIT 1
                }
            }
        }
    }
}

<#
    Uvozimo module. Če delamo v razhroščevalnem načinu, uporabimo stikalo -Debug, primer:
    Load-Module -Module "MSOnline" -Debug
#>

# Najprej osnovni moduli za povezljivost s storitvami
Load-Module -Module "MSOnline"
Load-Module -Module "AzureAD"
Load-Module -Module "ExchangeOnlineManagement"
Load-Module -Module "Microsoft.Online.SharePoint.PowerShell"
Load-Module -Module "SharePointPnPPowerShellOnline"
Load-Module -Module "MicrosoftTeams"

# Dva dodatna modula, zelo uporabna
Load-Module -Module "ImportExcel"
Load-Module -Module "CredentialManager"