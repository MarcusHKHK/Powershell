$scriptpath = $MyInvocation.MyCommand.Path
$dir = C:\scripts\AD_Kasutajad.csv

$last_name = @()
$users = $users=Import-Csv C:\scripts\AD_Kasutajad.csv
ForEach($user in $users){
    if( $user.gender -eq "Male"){
        $last_name += $user.last_name
    }
}

#sama kataloog, mis skriptil
$scriptpath = $MyInvocation.MyCommand.Path
$dir = C:\scripts\AD_Kasutajad.csv

#tekitame massiivi CSV päise jaoks
$csv_header = @("Eesnimi ; Perekonnanimi; email ; password ; Osakond")

#lisame päise CSV faili
$csv_header | Set-Content C:\scripts\AD_users.csv

#loeme sisse kasutajad
$users = Import-Csv C:\scripts\AD_Kasutajad.csv

#käime kasutajad rea kaupa läbi, loome andmed ja lisame CSV faili
ForEach($user in $users){
    $fname = $user.Eesnimi
    $lname = $user.Perekonnanimi

    $fname1c = $fname.Substring(0, [Math]::Min($fname.Length, 1))

    $pass = "Cool2Pass!"
    #$pass = 1..4 | ForEach-Object { Get-Random -Maximum $lname.Length }
    #$pass = -join $lname[$pass] 
    #$pass += Get-Random -Maximum 10

    $row =  $fname1c+$lname.ToLower()+" ; "+$fname.ToLower()+"."+$lname.ToLower()+"@metshein.com;"+$pass
    Add-Content C:\scripts\AD_users.csv $row
}
