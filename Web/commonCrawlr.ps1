Write-Host " "
Write-Host "finalResolution: Web Tools" -ForegroundColor Red
Write-Host " "
Write-Host "Passive Scan: CommonCrawl" -ForegroundColor Red
Write-Host "Description: Gathers latest indexes from CommonCrawl, queries selected index for entries containing the target domain." -ForegroundColor Red
Write-Host " "
Write-Host "Created by Gabriel H. @weekndr_sec" -ForegroundColor Red
Write-Host "https://github.com/ndr-repo | http://weekndr.me" -ForegroundColor Red
Write-Host " "
Write-Host "Continue?" -InformationAction Inquire
$cdxIndex = Invoke-RestMethod -Method Get -Uri "https://index.commoncrawl.org/collinfo.json" | Format-Table cdx-api -Wrap -AutoSize -HideTableHeaders | grep -o -P "^http.*"  | Out-String 
Write-Output " "
Write-Host "Found the following indexes:" -ForegroundColor Red
Write-Output " "
$cdxIndex | grep "[a-zA-Z0-9]" | awk -F '/' '{ print $4 }' | Sort-Object 
$titleIndex = Read-Host -Prompt "Enter the target index"
Write-Output " "
$targetDomain = Read-Host -Prompt "Enter the target domain" 
Write-Host " "
Write-Host "Downloading results for $targetDomain in $titleIndex..." -ForegroundColor Red
Write-Host " "
$request = Write-Output https://index.commoncrawl.org/$titleIndex"?url=*.$targetDomain&output=json"  | Out-String -Stream 
Invoke-RestMethod -Method Get -Uri $request | Format-Table -Property url,status -Wrap -AutoSize -HideTableHeaders | grep "[a-zA-Z0-9]" | awk -F ' ' '{ print $4,$6,$12,$10 }' | Out-File .\$titleIndex$targetDomain.csv -Force
(Get-Content .\$titleIndex$targetDomain.csv ) -replace ', ',',' | Out-File .\$titleIndex$targetDomain.csv utf8
Import-Csv .\$titleIndex$targetDomain.csv -Header "Date","URI","Status","Format" | Sort-Object -Property "Status","Format","URI" -Unique -Descending | Format-Table -Property "Status","Format","URI" -Wrap -AutoSize | Out-File .\$titleIndex$targetDomain-Result_Table.txt utf8
Get-Content .\$titleIndex$targetDomain-Result_Table.txt | more
