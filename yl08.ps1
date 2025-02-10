function ring-pind($radius=0){
    [Math]::Pow($radius,2)*[Math]::PI
    }

ring-pind -radius 3

function tyhikud($nimi="Vaikimisi nimi"){
    $uusnimi = $nimi -replace "\s+" ," "
    $uusnimi.Trim(" ");
    $uusnimi.TrimEnd(" ");
    $uusnimi.TrimStart(" ");
    "Siin on parantatud nimi: $uusnimi"
}

tyhikud -nimi "    Marcus                    "