function Get-AbrPfaArray {
    <#
    .SYNOPSIS
        Used by As Built Report to retrieve Pure Storage FlashArray system information from the Pure Stroage FlashArray API
    .DESCRIPTION

    .NOTES
        Version:        0.1.0
        Author:         Tim Carman
        Twitter:        @tpcarman
        Github:         tpcarman
    .EXAMPLE

    .LINK

    #>
    [CmdletBinding()]
    param (
    )

    begin {
        Write-PScriboMessage "Collecting Pure Storage FlashArray information from $Array."
    }

    process {
        try {
            $PfaArray = Get-Pfa2Array -Array $Array
            $PfaArrayVolumes = Get-Pfa2Volume -Array $Array
            $PfaArrayProtectionGroups = Get-Pfa2ProtectionGroup -Array $Array
            $PfaArrayProtectionGroupSnapshots = Get-Pfa2ProtectionGroupSnapshot -Array $Array -Name *
            $PfaArrayHosts = Get-Pfa2Host -Array $Array
            $PfaArrayHostGroups = Get-Pfa2HostGroup -Array $Array
            $PfaConnectedArrays = Get-Pfa2ArrayConnection -Array $Array
            if ($PfaArray) {
                Section -Style Heading2 'System Summary' {
                    Paragraph "The following section provides a summary of the array configuration for $($PfaArray.Name)."
                    BlankLine

                    $InObj = [Ordered] @{
                        'Array Name' = $PfaArray.Name
                        'Purity Version' = $PfaArray.Version
                        'Array ID' = $PfaArray.Id
                        'Number of Volumes' = $PfaArrayVolumes.Count
                        'Number of Protection Groups' = $PfaArrayProtectionGroups.Count
                        'Number of Protection Group Snapshots' = $PfaArrayProtectionGroupSnapshots.Count
                        'Number of Hosts' = $PfaArrayHosts.Count
                        'Number of Host Groups' = $PfaArrayHostGroups.Count
                        'Number of Connected Arrays' = $PfaConnectedArrays.Count
                    }

                    $PfaArrayInfo += [pscustomobject]$inobj

                    $TableParams = @{
                        Name = "System Summary - $($PfaArray.Name)"
                        List = $true
                        ColumnWidths = 40, 60
                    }
                    if ($Report.ShowTableCaptions) {
                        $TableParams['Caption'] = "- $($TableParams.Name)"
                    }

                    $PfaArrayInfo | Table @TableParams
                }
            }

        } catch {
            Write-PScriboMessage -IsWarning "PFA System Summary Section: $($_.Exception.Message)"
        }
    }

    end {

    }

}