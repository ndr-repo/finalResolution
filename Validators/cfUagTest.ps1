Write-Host " "
$uag = Read-Host "Enter the User-Agent to test through Cloudflare"
Write-Host " "
Invoke-RestMethod  -Method Get -Uri https://one.one.one.one/cdn-cgi/trace -UserAgent "$uag"
Write-Host "finalResolution v1.0.0" -ForegroundColor Red
Write-Host "Created by Gabriel H. @weekndr_sec" -ForegroundColor Red
Write-Host "https://github.com/ndr-repo | http://weekndr.me" -ForegroundColor Red
