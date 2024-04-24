function Get-AbrPfaDrive {
    <#
    .SYNOPSIS
        Used by As Built Report to retrieve Pure Storage FlashArray drive information from the Pure Stroage FlashArray API
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
        Write-PScriboMessage "Collecting Pure Storage FlashArray information from $($PfaArray.Name)."
    }

    process {
        $PfaDrives = Get-Pfa2Drive -Array $Array
        if ($PfaDrives) {
            Section -Style Heading2 'Disk Summary' {
                Paragraph "The following section provides a summary of the disks in $($PfaArray.Name)."
                BlankLine
                $PfaDriveInfo = foreach ($PfaDrive in $PfaDrives) {
                    [PSCustomObject] @{
                        'Name' = $PfaDrive.name
                        'Capacity GB' = Switch ($PfaDrive.Type) {
                            'SSD' { "$([math]::Round(($PfaDrive.capacity) / 1GB, 2)) G" }
                            'NVRAM' { "$([math]::Round(($PfaDrive.capacity) / 1MB, 2)) M"}
                            default { "$([math]::Round(($PfaDrive.capacity) / 1GB, 2)) G" }
                        }
                        'Type' = $PfaDrive.Type
                        'Protocol' = $PfaDrive.Protocol
                        'Status' = $PfaDrive.Status
                    }
                }

                $TableParams = @{
                    Name = "Disk Summary - $($PfaArray.Name)"
                    List = $false
                    ColumnWidths = 20, 20, 20, 20, 20
                }

                if ($Report.ShowTableCaptions) {
                    $TableParams['Caption'] = "- $($TableParams.Name)"
                }

                $PfaDriveInfo | Table @TableParams
            }
        }

    }

    end {}
}