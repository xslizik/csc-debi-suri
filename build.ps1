create-sandbox .\csc-debi-suri.yml
Remove-Item -Recurse -Force ".\sandbox\provisioning"
Copy-Item -Recurse -Force ".\provisioning" ".\sandbox\provisioning"
Set-Location -Path ".\sandbox"
manage-sandbox build -vvv