$SAMACL = (Get-Acl -Path "C:\Windows\System32\config\SAM").Access | Where-Object {$PSITEM.IdentityReference -eq "BUILTIN\Users"}
If($SAMACL){
    If($SAMACL.FileSystemRights.ToString().Contains("Read")){
        Write-Host -Object "Vulnerable"
    }
    Else{
        Write-Host -Object "NOTVulnerable"
    }
}
Else{
    Write-Host -Object "NOTVulnerable"
}
