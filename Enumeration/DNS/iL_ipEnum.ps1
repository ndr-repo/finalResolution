Write-Host "ipEnum" -ForegroundColor Red
Write-Host "Resolve a list of IP addresses from your default resolver" -ForegroundColor Red
$filePath = Read-Host "Enter the path to the target hostnames"
$resultFile = Read-Host "Enter the name for the result file (without extension)"
$pwd = Get-Location
Write-Host " "
$domainNames = Get-Content $filePath
New-Item $pwd\$resultFile.txt -Force
foreach ($domainName in $domainNames){ nslookup $domainName | Tee-Object $pwd\$resultFile.txt -Append }
Get-Content $pwd\$resultFile.txt -Encoding UTF8 | Sort-Object -Unique
Write-Host "Created by Gabriel H. @weekndr_sec" -ForegroundColor Red
Write-Host "https://github.com/ndr-repo | http://weekndr.me" -ForegroundColor Red
Write-Host "`n'I told you I can only show you the door. You have to walk through it.'`n" -ForegroundColor Red

