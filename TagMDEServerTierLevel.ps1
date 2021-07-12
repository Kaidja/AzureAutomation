Configuration TagMDEServerTierLevel
{
    
    Import-DscResource –ModuleName 'PSDesiredStateConfiguration'

    Node MDETAGGING {
        
        Script SetMDERegistryTags {
            SetScript = {

                $OU = ([adsisearcher]"(&(name=$env:computername)(objectClass=computer))").FindOne().path
                
                If($OU.Contains("Domain Controllers") -or $OU.Contains("Tier 0")){
                    $TierLevel = "TIER-0"
                }
                ElseIf($OU.Contains("Tier 1")){
                    $TierLevel = "TIER-1"
                }
                ElseIf($OU.Contains("Tier 2")){
                    $TierLevel = "TIER-2"
                }
                Else{
                    $TierLevel = "TIERING MISSING"
                }

                New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Advanced Threat Protection" -Name "DeviceTagging" -Force
                New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Advanced Threat Protection\DeviceTagging" -Name "Group" -Value $TierLevel -PropertyType String -Force
            }
            TestScript = {
                
                $TIERTag = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Advanced Threat Protection\DeviceTagging" -ErrorAction SilentlyContinue).Group
                $OU = ([adsisearcher]"(&(name=$env:computername)(objectClass=computer))").FindOne().path
                If($OU.Contains("Domain Controllers") -or $OU.Contains("Tier 0")){
                    $TierLevel = "TIER-0"
                }
                ElseIf($OU.Contains("Tier 1")){
                    $TierLevel = "TIER-1"
                }
                ElseIf($OU.Contains("Tier 2")){
                    $TierLevel = "TIER-2"
                }
                Else{
                    $TierLevel = "TIERING MISSING"
                }

                If($TIERTag -eq $TierLevel){
                    Return $True
                }
                Else{
                    Return $False
                }
            }
            GetScript = {

                $RegQuery = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Advanced Threat Protection\DeviceTagging" -Name Group -ErrorAction SilentlyContinue
                @{ Result = $RegQuery }
            
            }
        
        }
    }

}
