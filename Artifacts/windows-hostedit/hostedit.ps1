# Uncomment lines with localhost on them:
$hostsPath = "$env:windir\System32\drivers\etc\hosts"
$hosts = get-content $hostsPath
$hosts = $hosts | Foreach {if ($_ -match '^\s*#\s*(.*?\d{1,3}.*?localhost.*)')
                           {$matches[1]} else {$_}}
$hosts | Out-File $hostsPath -enc ascii

# Comment lines with localhost on them:
$hosts = get-content $hostsPath
$hosts | Foreach {if ($_ -match '^\s*([^#].*?\d{1,3}.*?localhost.*)') 
                  {"# " + $matches[1]} else {$_}} |
         Out-File $hostsPath -enc ascii
