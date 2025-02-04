#Marcus Krutto IT24
write-host
cls
hostname
Write-Host '***'
function Get-OSName
{
(Get-WmiObject Win32_Operatingsystem).name
}
Get-OSName
write-host '***'
Get-NetIPAddress -AddressFamily IPv4 | Sort-Object -Property InterfaceIndex | Format-Table
write-host '***'
function Get-RamSize
{
(Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property capacity -Sum).Sum /1gb
}
Get-RamSize
Write-Host '***'
Get-Counter -ComputerName localhost '\Process(*)\% Processor Time' `
    | Select-Object -ExpandProperty countersamples `
    | Select-Object -Property instancename, cookedvalue `
    | Sort-Object -Property cookedvalue -Descending | Select-Object -First 20 `
    | ft InstanceName,@{L='CPU';E={($_.Cookedvalue/100).toString('P')}} -AutoSize
write-host '***'
Get-WmiObject -Class Win32_UserAccount
Write-Host '***'
Get-WmiObject win32_VideoController | select name, currentH*, currentv*
write-host '***'

