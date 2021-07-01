#Query all servers from AD
$Servers = Get-ADComputer -Filter {operatingsystem -like "*server*"} -Properties operatingsystem

foreach($Server in $Servers){
    
    Invoke-Command -ScriptBlock {

        $AllLogs = Get-WinEvent -ListLog *
        $PrinterLogs = $AllLogs | where LogName -eq "Microsoft-Windows-PrintService/Operational"
        $PrinterLogs.IsEnabled = $True
        $PrinterLogs.SaveChanges()

    } -ComputerName $Server.Name

}
