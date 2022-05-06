Param(
    $TargetUserName,
    $TimeCreated

)

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls -bor [Net.SecurityProtocolType]::Tls11 -bor [Net.SecurityProtocolType]::Tls12

$TeamsWebHookURL = ""

$FormatDate = Get-date $TimeCreated -format "yyyy-MM-dd HH:mm"

$MessageTemplate = [PSCustomObject][Ordered]@{
"@type" = "MessageCard"
"@context" = "<http://schema.org/extensions>"
"title" = "RDP Logon on $env:COMPUTERNAME - $FormatDate"
"text" = "
User <strong>$TargetUserName</strong> just logged on <strong>$env:COMPUTERNAME</strong>.</br>
"
}
 
$TeamsMessageParameters = @{
    "URI" = $TeamsWebHookURL
    "Method" = 'POST'
    "Body" = (ConvertTo-Json $MessageTemplate)
    "ContentType" = 'application/json'
}
 
Invoke-RestMethod @TeamsMessageParameters
