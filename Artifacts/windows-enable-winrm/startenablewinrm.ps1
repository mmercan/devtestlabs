#$ping = New-Object System.Net.NetworkInformation.Ping
#$host1 = hostname
#$ips = $($ping.Send($host1).Address).IPAddressToString
#Write-Host $ips

$ipV4 = Test-Connection -ComputerName (hostname) -Count 1  | Select IPV4Address
 
$ip = $ipV4.IPV4Address.IPAddressToString
Write-Host $ip

./enablewinrm.ps1  -hostname $ip -protocol https
