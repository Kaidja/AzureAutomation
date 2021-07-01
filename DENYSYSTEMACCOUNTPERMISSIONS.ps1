Configuration DENYSYSTEMACCOUNTPERMISSIONS
{
    
    Import-DscResource –ModuleName 'AccessControlDSC' -ModuleVersion 1.4.1

    Node ConfigurePrintSpoolerFolderPermissions {
        
        NTFSAccessEntry SpoolDriversFolder
        {
            AccessControlList = @(
                NTFSAccessControlList
                {
                    Principal = "System"
                    ForcePrincipal = $true
                    AccessControlEntry = @(
                        NTFSAccessControlEntry
                        {
                            AccessControlType = 'Deny'
                            FileSystemRights = 'Modify'
                            Inheritance = 'This folder and files'
                            Ensure = 'Present'
                        }
                    )               
                }
                
            )
            Path = "C:\Windows\System32\spool\drivers"

        }
              
    }

}
