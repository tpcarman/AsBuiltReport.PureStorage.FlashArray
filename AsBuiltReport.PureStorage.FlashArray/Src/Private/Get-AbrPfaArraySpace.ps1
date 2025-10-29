function Get-AbrPfaArraySpace {
    <#
    .SYNOPSIS
        Used by As Built Report to retrieve Pure Storage FlashArray storage capacity information from the Pure Stroage FlashArray API
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

    begin {}

    process {

        $PfaArraySpace = Get-Pfa2ArraySpace -Array $Array

        $InObj = [Ordered] @{
            "Unique" = "$([math]::Round(($PfaArraySpace.Space.Unique / 1GB), 2)) G"
            "Snapshots" = "$([math]::Round(($PfaArraySpace.Space.Snapshots / 1KB), 2)) K"
            "Shared" = "$([math]::Round(($PfaArraySpace.Space.Shared / 1MB), 2)) M"
            "Replication" = [math]::Round($PfaArraySpace.Space.Replication, 2)
            "System" = [math]::Round($PfaArraySpace.Space.System, 2)
            'Empty' = "$([math]::Round(($PfaArraySpace.capacity - $PfaArraySpace.space.totalphysical) / 1GB, 2)) G"
            "Data Reduction" = "$([math]::Round($PfaArraySpace.Space.DataReduction, 2)) to 1"
            "Total Reduction" = "$([math]::Round($PfaArraySpace.Space.TotalReduction, 2)) to 1"
            "Used" = "$([math]::Round(($PfaArraySpace.Space.TotalUsed / 1GB), 2)) G"
            "Total" = "$([math]::Round(($PfaArraySpace.Capacity / 1GB), 2)) G"
            "Provisioned Size" = "$([math]::Round(($PfaArraySpace.Space.TotalProvisioned / 1GB), 2)) G"
            "Virtual" = "$([math]::Round(($PfaArraySpace.Space.Virtual / 1GB), 2)) G"
        }

        $PfaArraySpaceInfo += [pscustomobject]$inobj

        $TableParams = @{
            Name = "System Summary - $($PfaArray.Name)"
            List = $true
            ColumnWidths = 40, 60
        }
        if ($Report.ShowTableCaptions) {
            $TableParams['Caption'] = "- $($TableParams.Name)"
        }

        $PfaArraySpaceInfo | Table @TableParams

    }

    end {}
}