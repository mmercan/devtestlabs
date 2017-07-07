$ping = New-Object System.Net.NetworkInformation.Ping
$host1 = hostname
$ips = $($ping.Send($host1).Address).IPAddressToString
 
Write-Host $ips

./enablewinrm.ps1  -hostname $ips -protocol https
