
function New-PoshBotExampleBackend {
    <#
    .SYNOPSIS
        Creates a new instance of the example PoshBot backend class.
    .DESCRIPTION
        Creates a new instance of the example PoshBot backend class.
    .PARAMETER Configuration
        Hashtable of required properties needed by the backend to initialize and
        connect to the backend chat network.
    .EXAMPLE
        PS C:\> $config = @{Name = 'ExampleBackend'; Token = '<API-TOKEN>'}
        PS C:\> $backend = New-PoshBotExampleBackend -Configuration $config

        Create a hashtable containing required properties for the backend
        and create a new backend instance from them
    .INPUTS
        hashtable
    .OUTPUTS
        ExampleBackend
    #>
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '', Scope='Function', Target='*')]
    [cmdletbinding()]
    param(
        [parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [Alias('BackendConfiguration')]
        [hashtable[]]$Configuration
    )

    process {
        foreach ($item in $Configuration) {
            if (-not $item.Token) {
                throw 'Configuration is missing [Token] parameter'
            } else {
                Write-Verbose 'Creating new example backend instance'

                # Note that [token] is just an example
                # In a real backend plugin, you would pass any
                # needed information from $Configuration to
                # the constructor
                $backend = [ExampleBackend]::new($item.Token)
                if ($item.Name) {
                    $backend.Name = $item.Name
                }
                $backend
            }
        }
    }
}

Export-ModuleMember -Function 'New-PoshBotExampleBackend'
