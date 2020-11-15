<#
    Moduli za upravljanje Microsoft 365 s Powershell omogočajo interakcijo s posameznimi 
    storitvami. Modul je najprej treba namestiti, nato pa uvoziti.

    Funkcijo Load-Module sem pripravil tako, da si delo z nameščanjem in uvažanjem nekoliko
    poenostavim.
#>

Function Load-Module ($module) {

    # Če je modul že uvožen, obvesti uporabnika
    if (Get-Module | Where-Object {$_.Name -eq $module}) {
        write-host "Modul $module je že uvožen."
    }
    else {

        # Če modul ni uvožen, a je na voljo na disku, ga uvozi
        if (Get-Module -ListAvailable | Where-Object {$_.Name -eq $module}) {
            Import-Module $module -Verbose
        }
        else {

            # Če modul ni uvožen, niti ga ni na disku, a je na voljo v spletni galeriji, ga namesti in uvozi
            if (Find-Module -Name $module | Where-Object {$_.Name -eq $module}) {
                Install-Module -Name $module -Force -Verbose -Scope CurrentUser
                Import-Module $module -Verbose
            }
            else {

                # Modula ni nikjer. Sorry.
                write-host "Modul $module ni na voljo, zaključujem."
                EXIT 1
            }
        }
    }
}

<#
    Uvozimo module
#>

# Najprej osnovni moduli za povezljivost s storitvami
Load-Module -module "MSOnline"
Load-Module -module "AzureAD"
Load-Module -module "ExchangeOnlineManagement"
Load-Module -module "Microsoft.Online.SharePoint.PowerShell"
Load-Module -module "SharePointPnPPowerShellOnline"
Load-Module -module "MicrosoftTeams"

# Dva dodatna modula, zelo uporabna
Load-Module -module "ImportExcel"
Load-Module -module "CredentialManager"