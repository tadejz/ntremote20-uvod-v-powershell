<#
    Vsi ukazi v okolju Powershell se pričnejo z glagolom, na primer Get-, Set-, New- 
    in nadaljujejo s  samostalniki v CamelCase. Powershell sicer praviloma ni občutljiv 
    na velikost črk, a je prav, da gojimo lepo kodo v naših skriptah. Primer ukaza:

    Write-Output

    Namig: TAB omogoča samodejno dopolnjevanje ukazov naprej, Shift + TAB pa nazaj.
#>

Get-Process


<#
    Spremenljivke v Powershell začnemo z oznako $ in imenom spremenljivke. Tip 
    spremenljivke lahko določimo vnaprej ali pa se določi glede na podatke, ki jih 
    vanjo shranimo.
#>

$procesi = Get-Process


<#
    Za prikaz podatkov v vmesniku imamo več možnosti, bodisi uporabimo Write-Output ali pa preprosto v svojo vrstico vpišemo ime spremenljivke.
#>

Write-Output $procesi
$procesi


<#
    Kadar želimo uporabniku prijazno predstaviti določeno spremenljivko, jo vključimo v besedilo.
#>

Write-Output "Vaše uporabniško ime je $env:USERNAME."


<#
    Odstranjevanje spremenljivke je nekoliko posebno, saj ime spremenljivke ukazu Remove-Variable posredujemo brez predpone $.
#>

Remove-Variable procesi

<#
    Posebni spremenljivki $true in $false sta rezervirani besedi in predstavljata logični 
    TRUE in FALSE.
#>

$pogoj = $true


<#
    Primer pogojnega (IF) stavka
#>

if ( $pogoj )
{
    Write-Output "Vrednost spremenljivke `$Pogoj je $Pogoj."
}
else
{
    Write-Output "Vrednost spremenljivke `$Pogoj je $Pogoj."
}