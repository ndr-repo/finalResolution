 $ip = Read-Host "Enter Target IP Address"
 $drillDown = Read-Host "Enter Property to Expand [cpes, hostnames, ip, ports, tags, vulns]"
 Write-Host " "
 Invoke-RestMethod -Method Get -Uri https://internetdb.shodan.io/$ip | Select-Object -ExpandProperty $drillDown | Format-Table 
 Write-Host " "
 Write-Host "finalResolution v1.0.0" -ForegroundColor Red
 Write-Host "Created by Gabriel H. @weekndr_sec" -ForegroundColor Red
 Write-Host "https://github.com/ndr-repo | http://weekndr.me" -ForegroundColor Red

