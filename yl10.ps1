$xml = [xml](Get-Content C:\scripts\customers.xml)
$rows = $xml.customers.customer
foreach ($row in $rows){
    if($row.country -contains 'Poland'){
        $row.full_name
    }
}
