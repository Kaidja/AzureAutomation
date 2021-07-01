#Query all servers from AD
$Servers = Get-ADComputer -Filter {operatingsystem -like "*server*"} -Properties operatingsystem

foreach($Server in $Servers){
    
    Invoke-Command -ScriptBlock {

        Stop-Service -Name Spooler -Force
        Set-Service -Name Spooler -StartupType Disabled

    } -ComputerName $Server.Name

}
