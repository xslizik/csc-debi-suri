create-sandbox .\csc_topology.yml
Remove-Item -Recurse -Force ".\sandbox\provisioning"
Copy-Item -Recurse -Force ".\provisioning" ".\sandbox\provisioning"
Set-Location -Path ".\sandbox"
manage-sandbox build -vvv