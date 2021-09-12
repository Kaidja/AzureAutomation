#Install the module
Install-Module -Name Az -Verbose -Force

#Connect
Connect-AzAccount

#Get the Azure Subscriptions(Only needed, if you have more than one subscription)
Get-AzSubscription

#Change the subscription context (Only needed, if you have more than one subscription)
#Replace the XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXX with the actual subscription ID
Set-AzContext -Subscription XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXX 

#Import the role. Do not forgot to replace the XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXX with real subscription ID
New-AzRoleDefinition -InputFile "C:\CustomAZUpdateManagementRole.json"
