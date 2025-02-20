Write-Host "`nThatsMyType: DNS enumeration through targeted RFC queries`n" -ForegroundColor Red
$hostnames = Read-Host "Enter the path to target hostnames"
$resolver = Read-Host "Enter the IP or hostname of the target DNS server"
$type = Read-Host "Enter the DNS query type"
$targets = Get-Content $hostnames | Sort-Object -Unique
foreach ($target in $targets){ nslookup -type="$type" $target $resolver | Tee-Object .\resolutions-$type-$resolver.txt -Append }
Write-Host "`nSUCCESS: Results saved to resolutions-$type-$resolver.txt.`n`nIf the file already exists, the results have been appended to the existing content." -ForegroundColor Red
Write-Host "`nThatsMyType: DNS enumeration through targeted RFC queries" -ForegroundColor Red
Write-Host "Created by Gabriel H. @weekndr_sec" -ForegroundColor Red
Write-Host "https://github.com/ndr-repo | http://weekndr.me" -ForegroundColor Red
Write-Host "`n'I told you I can only show you the door. You have to walk through it.'`n" -ForegroundColor Red