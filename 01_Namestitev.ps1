<#
    Najpogostejša prva ovira pri uporabi Powershell je Execution Policy, saj je privzeto za 
    Powershell 5.1 na Windows 10 nastavljen na Restricted. Več o tem najdete na spletni strani 
    https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies. 
    
    RemoteSigned je zmerna vmesna možnost.
#>

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned