Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)
    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

$zipfile = "https://raw.githubusercontent.com/mmercan/devtestlabs/master/Artifacts/windows-create-seleniumdrivers/phantomjs.zip"

$webclient = New-Object System.Net.WebClient
$filepath = "$pwd\phantomjs.zip"
$webclient.DownloadFile($zipfile,$filepath)
echo "Saved $filename"

Unzip -zipfile $filepath -outpath "C:\drivers"


$AddedLocation ="c:\drivers"
$Reg = "Registry::HKLM\System\CurrentControlSet\Control\Session Manager\Environment"
$OldPath = (Get-ItemProperty -Path "$Reg" -Name PATH).Path
$NewPath= $OldPath + ';' + $AddedLocation
Set-ItemProperty -Path "$Reg" -Name PATH -Value $NewPath
