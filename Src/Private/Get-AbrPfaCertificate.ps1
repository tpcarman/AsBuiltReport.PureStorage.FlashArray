function Get-AbrPfaCertificate {
    <#
    .SYNOPSIS
        Used by As Built Report to retrieve Pure Storage FlashArray certificate information from the Pure Stroage FlashArray API
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
        Write-PScriboMessage "Collecting Pure Storage FlashArray SSL certificate information from $($PfaArray.Name)."
    }

    process {
        $PfaCertificate = Get-Pfa2Certificate | Where-Object {$_.name -eq 'management' }

        if ($PfaCertificate) {
            $InObj = [Ordered] @{
                'Status' = $PfaCertificate.Status
                'Key Size' = $PfaCertificate.KeySize
                'Issued To' = $PfaCertificate.IssuedTo
                'Issued By' = $PfaCertificate.IssuedBy
                'Valid From' = $PfaCertificate.ValidFrom
                'Valid To' = $PfaCertificate.ValidTo
                'State/Province' = $PfaCertificate.State
                'Locality' =  = $PfaCertificate.Locality
                'Organization' = $PfaCertificate.Organization
                'Organization Unit' = $PfaCertificate.OrganizationalUnit
                'Email' = $PfaCertificate.Email
            }

            $PfaCertificateInfo += [pscustomobject]$inobj

            $TableParams = @{
                Name = "SSL Certificate - $($PfaArray.Name)"
                List = $true
                ColumnWidths = 40, 60
            }
            if ($Report.ShowTableCaptions) {
                $TableParams['Caption'] = "- $($TableParams.Name)"
            }

            $PfaCertificateInfo | Table @TableParams
        }

    }

    end {}
}