#Marcus Krutto IT24
[string]$essjapnimi = 'Marcus Krutto'
[string]$minueemail = 'marcus@hkhk.edu.ee'
[datetime]$kuupaev | get-date

$essjapnimi
$minueemail

$skriptiAsukoht = 'C:\Users\Administrator\Documents\GitHub\Powershell'

$skriptiAsukoht = $MyInvocation.MyCommand.Path
$dir = Split-Path $skriptiAsukoht
$emailid = Get-Content -path $dir\emailid.txt
