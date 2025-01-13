$targetVal = Read-Host 'Enter the target hostname'
$geonet = Invoke-WebRequest -Method Get -Uri https://geonet.shodan.io/api/geodns/$targetVal
$geoping = Invoke-WebRequest -Method Get -Uri https://geonet.shodan.io/api/geoping/$targetVal
$geoping | ConvertFrom-Json | Format-Table -Wrap -AutoSize
Start-Sleep -Seconds 1 
$geonet | ConvertFrom-Json  | Format-Table -Wrap -AutoSize
Write-Host " "
Write-Host "finalResolution v1.0.0" -ForegroundColor Red
Write-Host "Created by Gabriel H. @weekndr_sec" -ForegroundColor Red
Write-Host "https://github.com/ndr-repo | http://weekndr.me" -ForegroundColor Red