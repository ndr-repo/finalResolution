$hostname = Read-Host "Enter Target Domain Name"
Write-Host " "
Write-Host "Quad9: " -ForegroundColor Red
Invoke-RestMethod -Method Get -Uri https://api.quad9.net/search/$hostname | Format-Table
Write-Host " "
Write-Host "finalResolution v1.0.0" -ForegroundColor Red
Write-Host "Created by Gabriel H. @weekndr_sec" -ForegroundColor Red
Write-Host "https://github.com/ndr-repo | http://weekndr.me" -ForegroundColor Red

