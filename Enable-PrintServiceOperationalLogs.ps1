$AllLogs = Get-WinEvent -ListLog *
$PrinterLogs = $AllLogs | where LogName -eq "Microsoft-Windows-PrintService/Operational"
$PrinterLogs.IsEnabled = $True
$PrinterLogs.SaveChanges()
