$scriptpath = $MyInvocation.MyCommand.Path
$dir = C:\scripts\users.csv

$last_name = @()
$users = $users=Import-Csv C:\scripts\users.csv
ForEach($user in $users){
    if( $user.gender -eq "Male"){
        $last_name += $user.last_name
    }
}

$last_name

#sama kataloog, mis skriptil
$scriptpath = $MyInvocation.MyCommand.Path
$dir = Split-Path $scriptpath

#tekitame massiivi CSV päise jaoks
$csv_header = @("email;password")

#lisame päise CSV faili
$csv_header | Set-Content $dir\emails.csv

#loeme sisse kasutajad
$users = Import-Csv $dir\users.csv

#käime kasutajad rea kaupa läbi, loome andmed ja lisame CSV faili
ForEach($user in $users){
    $fname = $user.first_name
    $lname = $user.last_name

    $fname1c = $fname.Substring(0, [Math]::Min($fname.Length, 1))

    $pass = 1..4 | ForEach-Object { Get-Random -Maximum $lname.Length }
    $pass = -join $lname[$pass] 
    $pass += Get-Random -Maximum 10

    $row =  $fname1c+$lname.ToLower()+" ; "+$fname.ToLower()+"."+$lname.ToLower()+"@metshein.com;"+$pass
    Add-Content $dir\emails.csv $row
}
$username