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
    Primer pogojnega stavka
#>

if ( $pogoj )
{
    Write-Output "Vrednost spremenljivke `$Pogoj je $Pogoj."
}
else
{
    Write-Output "Vrednost spremenljivke `$Pogoj je $Pogoj."
}

<#
    Sprehajanje po vrednostih

    Pri obdelavi večjih količin podatkov v poljih se boste želeli sprehoditi po vrednostih 
    v teh poljih. Na voljo imamo nekaj pristopov in sicer:

    1. $spremenljivka | ForEach-Object
    2. foreach ($spremenljivka in $spremenljivke)

    Mimogrede smo spoznali še "pipe" znak, | (AltGr + W)
#>

$procesi | ForEach-Object {
    $_
}

<#
    Najpogosteje uporabljam ta pristop, saj mi omogoča, da sploh večje obdelave testiram na 
    manjšem obsegu podatkov:
    - prikažem samo prvega, primer $procesi[0] ali
    - prikažem prve 3, primer $procesi[0..2] ali
    - od 20. elementa do koncam primer $procesi[19..$procesi.Count]
    - ...
#> 

$procesi[0] | ForEach-Object {
    $_
}

<#
    $_ prikaže atribute objekta ali vrednost v posamezni iteraciji ForEach zanke. Če dodamo
    še piko lahko prikaz omejimo na posamezen atribut objekta.
#>

$procesi[0..3] | ForEach-Object {
    <# 
        Generalno atribut posameznega objekta ne moremo uporabiti v drugih funkcijah
        (primer spodaj je Write-Output), razen izjemoma, zato jih praviloma posebej definiramo.
    #>
    $processName = $_.ProcessName
    $id = $_.Id

    Write-Output "$processName ima ID $id."
}