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


$oldPath=(Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINESystemCurrentControlSetControlSession ManagerEnvironment' -Name PATH).Path
$newPath=$oldPath+';C:\drivers'
Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINESystemCurrentControlSetControlSession ManagerEnvironment' -Name PATH -Value $newPath
