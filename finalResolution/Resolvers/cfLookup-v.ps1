$targetDomain = Read-Host "Enter the target domain name"
Write-Host " "
Write-Host "one.one.one.one: " -ForegroundColor Red
Write-Host " "
cmd /C curl -H 'accept: application/dns-json' "https://one.one.one.one/dns-query?name=$targetDomain" | Out-String | ConvertFrom-Json | Select-Object -ExpandProperty Answer | Format-Table
Write-Host " "
Write-Host "cloudflare-dns.com: " -ForegroundColor Red
Write-Host " "
cmd /C curl -H 'accept: application/dns-json' "https://cloudflare-dns.com/dns-query?name=$targetDomain" | Out-String | ConvertFrom-Json | Select-Object -ExpandProperty Answer | Format-Table
Write-Host " "
Write-Host "finalResolution v1.0.0" -ForegroundColor Red
Write-Host "Created by Gabriel H. @weekndr_sec" -ForegroundColor Red
Write-Host "https://github.com/ndr-repo | http://weekndr.me" -ForegroundColor Red