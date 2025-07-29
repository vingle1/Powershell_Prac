#Script to map hostnames to MACs on the same network
#Author: Ingle

$FatboxNames = @("fatbox1","fatbox2") #change this to your fatbox nbames

foreach ($FatboxName in $FatboxNames) {
    # fatbox name to IP
    $DnsRecords = Resolve-DnsName $FatboxName -Type A
    $IPAddress = $DnsRecords | Select-Object -ExpandProperty IPAddress

    # get MACs
    $Neighor = Get-NetNeighbor -IPAddress $IPAddress -ErrorAction SilentlyContinue
    $MacAddress = $Neighor.LinkLayerAddress

    Write-Host "Fatbox: $FatboxName, IP: $IPAddress, MAC: $MacAddress"

}
