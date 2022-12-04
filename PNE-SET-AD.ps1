# Import the Active Directory module into the Powershell sessio
Import-Module ActiveDirectory
# Search for the accounts in Active Directory with Password Set to Never Expire and export report to the C drive
# Get accounts name, display name, Password Set To Expire status and last password set time/date
get-aduser -filter * -properties Name, DisplayName, PasswordNeverExpires, passwordlastset |     
# Only get accounts where Password Set to Never Expire is TRUE      
where {$_.passwordNeverExpires -eq "true" } | 
# Display the Account name, Display Name, Account status and AD DN                                       
Select-Object Name,DisplayName,Enabled, PasswordLastSet, DistinguishedName |
# Export report to CSV                       
Export-csv c:\pw_never_expires.csv -NoTypeInformation                              
