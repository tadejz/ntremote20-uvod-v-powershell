<#
    Za povezljvost z Azure AD lahko uporabimo dva modula:
    - MSOnline (starejši, včasih bolj prijazen in nekoliko počasnejši)
    - AzureAD (novejši, osnovan na Graph API, hitrejši, nekateri posegi so manj prijazne)

    Zaradi teh posebnosti včasih uporabim kar oba hkrati.

    Ukaza Connect-MSOLService in Connect-AzureAD vzpostavita avtentikacijo z Azure AD. Oba načina 
    povezljivosti ohranjata sejo (persistent) oziroma jo podaljšata po potrebi. Connect-MSOLService 
    niti nima nasprotnega ukaza (disconnect), medtem ko modul AzureAD pozna tudi ukaz 
    Disconnect-AzureAD. Če je možno, seveda priporočam, da sproti zapirate odprte povezave, 
    kar je še posebej pomembno pri ožje specializiranih modulih (na primer Exchange Online).
#>

Connect-MSOLService
Connect-AzureAD

<#
    Kako vemo, ali smo povezani? V primeru Connect-MSOLService je povezava vzpostavljena če
    ne prejmemo obvestila o napaki. Ker upravljam z veliko organizacijami, sem si pripravil 
    kratko funkcijo, ki mi olajša upravljanje, predvsem pa preklop med okolji
#>

function Connect-Microsoft365 {
    param (
        [Parameter(Mandatory=$false)][switch]$Connected, # Stikalo za prikaz najbolj uporabnih informacij
        [Parameter(Mandatory=$false)][switch]$Details # Stikalo za prikaz najbolj uporabnih informacij
    )

    # Connect to Microsoft Online Services (AAD) by displaying ADAL window
    if ( !$Connected )
    {
        # Disconnect previously active AzureAD connection
        Disconnect-AzureAD

        # Connect to service
        Connect-MsolService
        Connect-AzureAD
    }

    # Pridobimo seznam domen v okolju, hkrati pa tako tudi preverimo, če smo sploh povezani
    $domains = Get-MsolDomain

    if ( $domains.Count -gt 0 )
    {
        # Shranimo ime organizacije
        $org = (Get-MsolCompanyInformation).DisplayName

        # prikažimo dobrodošlico
        Write-Output "Dobrodošli v Microsoft 365 okolju organizacije $org."
        if ( $Details )
        {
            # Preštejemo vse domene in eno (primarno) odštejemo
            $domainCount = $domains.Count - 1

            # Poiščemo primarno domeno, vedno je v obliki *.onmicrosoft.com
            $primaryDomain = ($domains | Where-Object { $_.Name -like "*.onmicrosoft.com" }).Name

            # Prikažemo opis domen in nato še seznam
            Write-Output "`r`nV okolju se poleg primarne domene $primaryDomain nahaja še $domainCount domen in sicer:"
            Get-MsolDomain

            $activeLicenses = (Get-MsolAccountSku | Where-Object { $_.ActiveUnits -gt 0 }).Count
            Write-Output "`r`nV okolju je na voljo $activeLicenses aktivnih licenčnih paketov in sicer:"

            # Prikažemo še stanje licenc
            Get-MsolAccountSku | Format-Table
        }
    }
}