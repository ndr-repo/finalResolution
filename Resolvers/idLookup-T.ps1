$ip = Read-Host "Enter Target IP Address"
Invoke-WebRequest -Method Get -Uri https://internetdb.shodan.io/$ip  | ConvertFrom-Json | Format-Table -Wrap -AutoSize
" "
Write-Host "finalResolution v1.0.0" -ForegroundColor Red
Write-Host "Created by Gabriel H. @weekndr_sec" -ForegroundColor Red
Write-Host "https://github.com/ndr-repo | http://weekndr.me" -ForegroundColor Red

