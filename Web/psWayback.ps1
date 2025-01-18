Write-Host " "
Write-Host "finalResolution: Web Tools" -ForegroundColor Red
Write-Host " "
Write-Host "Passive Scan: WaybackURLs" -ForegroundColor Red
Write-Host "Description: Gathers indexed URIs from archive.org. Inspired by @mhmdiaa's Python Gist." -ForegroundColor Red
Write-Host " "
Write-Host "Created by Gabriel H. @weekndr_sec" -ForegroundColor Red
Write-Host "https://github.com/ndr-repo | http://weekndr.me" -ForegroundColor Red
Write-Host " "
Write-Host "Continue?" -InformationAction Inquire
$targetDomain = Read-Host "Enter the target domain" 
Write-Host "Gathering indexed URLs for $targetdomain..." -ForegroundColor Red
Write-Host " "
$resultsFile = "waybackurls_$targetDomain.txt"
Invoke-RestMethod -Method Get -Uri "http://web.archive.org/cdx/search/cdx?url=$targetDomain/*&output=json&fl=original&collapse=urlkey" | Select-Object -ExpandProperty SyncRoot | grep -o -P "^http.*" | Out-File $resultsFile
Write-Host " "
# Get-Content $resultsFile | Sort-Object -Descending | more
Write-Host " "
Write-Host "Output saved to $resultsFile" -ForegroundColor Red
Write-Host " "