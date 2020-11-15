<#
    Za povezljvost z Azure AD lahko uporabimo dva modula:
    - MSOnline (starejši, včasih bolj prijazen in nekoliko počasnejši)
    - AzureAD (novejši, osnovan na Graph API, hitrejši, nekateri posegi so manj prijazne)

    Osebno včasih uporabim kar oba hkrati. :)
#>

<#
    Connect-MSOLService in Connect-AzureAD vzpostavita povezavo z Azure AD. Oba načina povezljivosti 
    sta trajna (persistent) in veljata Connect-MSOLService dejansko niti nima nasprotnega ukaza, 
    medtem ko drugi pozna tudi ukaz Disconnect-AzureAD.
#>

Connect-MSOLService
Connect-AzureAD