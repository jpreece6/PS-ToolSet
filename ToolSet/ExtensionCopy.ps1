#
# Script.ps1
#

Write-Host "Copying files..."

Copy-Item -Path "D:\test" -Destination "D:\test2" -filter *.lib -Recurse -Verbose

Write-Host "Done"