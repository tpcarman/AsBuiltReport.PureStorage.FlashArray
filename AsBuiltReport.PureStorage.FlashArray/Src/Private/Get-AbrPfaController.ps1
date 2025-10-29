function Get-AbrPfaController {
    <#
    .SYNOPSIS
        Used by As Built Report to retrieve Pure Storage FlashArray controller information from the Pure Stroage FlashArray API
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
        Write-PScriboMessage "Collecting Pure Storage FlashArray controller information from $($PfaArray.Name)."
    }

    process {

        $PfaControllers = Get-Pfa2Controller -Array $Array

        if ($PfaControllers) {
            Section -Style Heading2 'Controller Summary' {
                Paragraph "The following section provides a summary of the controllers in $($PfaArray.Name)."
                BlankLine
                $PfaControllerInfo = foreach ($PfaController in $PfaControllers) {
                    [PSCustomObject] @{
                        'Name' = $PfaController.name
                        'Mode' = $PfaController.mode
                        'Model' = $PfaController.model
                        'Purity Version' = $PfaController.version
                        'Status' = $PfaController.status
                    }
                }

                $TableParams = @{
                    Name = "Controllers - $($PfaArray.Name)"
                    List = $true
                    ColumnWidths = 40, 60
                }

                if ($Report.ShowTableCaptions) {
                    $TableParams['Caption'] = "- $($TableParams.Name)"
                }

                $PfaControllerInfo | Table @TableParams
            }
        }

        end {}
    }
}