Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)
    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

$zipfile = "https://raw.githubusercontent.com/mmercan/devtestlabs/master/Artifacts/windows-change-resolution/ChangeScreenResolution.zip"

$webclient = New-Object System.Net.WebClient
$filepath = "$pwd\ChangeScreenResolution.zip"
$webclient.DownloadFile($zipfile,$filepath)
echo "Saved $filename"

Unzip -zipfile $filepath -outpath "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp"

robocopy ".\ChangeScreenResolution" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp"
