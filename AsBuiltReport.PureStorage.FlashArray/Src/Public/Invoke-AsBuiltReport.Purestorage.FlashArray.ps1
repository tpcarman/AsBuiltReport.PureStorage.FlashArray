function Invoke-AsBuiltReport.PureStorage.FlashArray {
    <#
    .SYNOPSIS
        PowerShell script to document the configuration of PureStorage FlashArray in Word/HTML/Text formats
    .DESCRIPTION
        Documents the configuration of PureStorage FlashArray in Word/HTML/Text formats using PScribo.
    .NOTES
        Version:        0.5.0
        Author:         Tim Carman
        Twitter:
        Github:
        Credits:        Iain Brighton (@iainbrighton) - PScribo module

    .LINK
        https://github.com/AsBuiltReport/AsBuiltReport.PureStorage.FlashArray
    #>

	# Do not remove or add to these parameters
    param (
        [String[]] $Target,
        [PSCredential] $Credential
    )

    Write-ReportModuleInfo -ModuleName 'PureStorage.FlashArray'

    # Import Report Configuration
    $Report = $ReportConfig.Report
    $InfoLevel = $ReportConfig.InfoLevel
    $Options = $ReportConfig.Options

    # Used to set values to TitleCase where required
    $TextInfo = (Get-Culture).TextInfo

	# Update/rename the $System variable and build out your code within the ForEach loop. The ForEach loop enables AsBuiltReport to generate an as built configuration against multiple defined targets.

    #region foreach loop
    foreach ($System in $Target) {
        Try {
            Write-PScriboMessage "Connecting to Pure Storage FlashArray $System."
            $Array = Connect-Pfa2Array -EndPoint $System -Credential $Credential -IgnoreCertificateError -ErrorAction Stop
        } Catch {
            Write-PScriboMessage -IsWarning $_.Exception.Message
        }


	}
	#endregion foreach loop
}
