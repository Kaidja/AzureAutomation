Configuration ENABLEDSCPRINTSPOOLERLOGCONFIG {

   Import-DscResource –ModuleName 'ComputerManagementDsc'

   Node StandardConfiguration {

        WindowsEventLog EnablePrintServiceOperationalLogs
        {
            LogName = "Microsoft-Windows-PrintService/Operational"
            IsEnabled = $True
        }

    }
}
