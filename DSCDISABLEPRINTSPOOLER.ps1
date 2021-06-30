Configuration DSCDISABLEPRINTSPOOLER {

   Import-DscResource –ModuleName 'PSDesiredStateConfiguration'

   Node StandardConfiguration {

        Service PrintSpooler {
            Name = "Spooler"
            DisplayName = "Print Spooler"
            Ensure = "Present"
            StartupType = "Disabled"
            State = "Stopped"

        }

    }
}
