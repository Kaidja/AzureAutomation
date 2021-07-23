(Get-Acl -Path "C:\Windows\System32\config\SAM").Access | Where-Object {$PSITEM.IdentityReference -eq "BUILTIN\Users"}
