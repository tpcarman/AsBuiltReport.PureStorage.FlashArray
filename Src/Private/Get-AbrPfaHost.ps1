function Get-AbrPfaHost {
    <#
    .SYNOPSIS
        Used by As Built Report to retrieve Pure Storage FlashArray host information from the Pure Stroage FlashArray API
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
        Write-PScriboMessage "Collecting Pure Storage FlashArray host information from $($PfaArray.Name)."
    }

    process {

        $PfaHosts = Get-Pfa2Host -Array $Array
        if ($PfaHosts) {
            Section -Style Heading3 'Hosts' {
                Paragraph "The following section provides information on the hosts defined on $($PfaArray.Name)."
                BlankLine
                foreach ($PfaHost in $PfaHosts) {
                    $InObj = [PSCustomObject] @{
                        'Host Name' = $PfaHost.Name
                        'Host Group' = Switch ($PfaHost.HostGroup.name) {
                            $null { '--' }
                            default { $PfaHost.HostGroup.name }
                        }
                        'Interface' = & {
                            if ($PfaHost.iqns) {
                                "iSCSI"
                            } elseif ($PfaHost.wwns) {
                                "FC"
                            } else {
                                "TBD"
                            }
                        }
                        '# Volumes' = $PfaHost.ConnectionCount
                        'Preferred Array' = Switch ($PfaHost.PreferredArrays) {
                            $null { '--' }
                            default { $PfaHost.PreferredArrays }
                        }
                        'Personality' = Switch ($PfaHost.Personality) {
                            $null { '--' }
                            default { $PfaHost.Personality }
                        }
                    }

                    if ($PfaHost.iqns) {
                        Add-Member -InputObject $InObj -MemberType NoteProperty -Name 'IQN' -Value "$($PfaHost.iqns -join ', ')"
                    }
                    if ($PfaHost.wwns) {
                        Add-Member -InputObject $InObj -MemberType NoteProperty -Name 'WWN' -Value ($PfaHost.wwns -split "(\w{2})" | Where-Object {$_ -ne ""}) -join ':'
                    }
                    if ($PfaHost.nqns) {
                        Add-Member -InputObject $InObj -MemberType NoteProperty -Name 'NQN' -Value "$($PfaHost.nqns  -join ', ')"
                    }

                    $PfaHostInfo += $InObj
                }

                $TableParams = @{
                    Name = "Hosts Summary - $($PfaArray.Name)"
                    List = $false
                    #ColumnWidths = 20, 20, 20, 20, 20
                }

                if ($Report.ShowTableCaptions) {
                    $TableParams['Caption'] = "- $($TableParams.Name)"
                }

                $PfaHostInfo | Table @TableParams
            }
        }

        end {}
    }
}