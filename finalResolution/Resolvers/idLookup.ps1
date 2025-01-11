$ip = Read-Host "Enter Target IP Address"
$dbResults = "C:\Users\chamisuL\discoveryOps\id\"
New-Item -ItemType Directory -Name $ip -Path $dbResults -ErrorAction Ignore
New-Item -ItemType File -Name $ip.json -Path $dbResults$ip -ErrorAction Ignore 
Invoke-WebRequest -Method Get -Uri https://internetdb.shodan.io/$ip  | ConvertFrom-Json
" "
Write-Host "finalResolution v1.0.0" -ForegroundColor Red
Write-Host "Created by Gabriel H. @weekndr_sec" -ForegroundColor Red
Write-Host "https://github.com/ndr-repo | http://weekndr.me" -ForegroundColor Red
