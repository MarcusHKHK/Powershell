#Marcus Krutto IT24
$essjapnimi = 'Marcus Krutto'
$minueemail = 'marcus@hkhk.edu.ee'
[datetime]$kuupaev | get-date

$essjapnimi
$minueemail

$skriptiAsukoht = 'C:\Users\Administrator\Documents\GitHub\Powershell'

$skriptiAsukoht = $MyInvocation.MyCommand.Path
$dir = Split-Path $skriptiAsukoht
$emailid = Get-Content -path $dir\emailid.txt

$esimene =$emailid.Split(',')[0]
$viimane =$emailid.Split(',')[-1]
$test = $emailid.Split(',')
$testimine =[array]$test
$counter = $testimine.Length
$esimene
$viimane
Write-Host "Emaile on siin $counter tükki"
