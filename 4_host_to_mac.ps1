#Script to map hostnames to MACs on the same network
#Author: Ingle

$FatboxNames = @("fatbox1","fatbox2") #change this to your fatbox names

foreach ($FatboxName in $FatboxNames) {
    # fatbox name to IP
    $DnsRecords = Resolve-DnsName $FatboxName -Type A
    $IPAddress = $DnsRecords | Select-Object -ExpandProperty IPAddress

    # populate ARP cache
    Test-Connection -ComputerName $IPAddress -Count 1 -ErrorAction SilentlyContinue | Out-Null

    # get MACs
    $Neighor = Get-NetNeighbor -IPAddress $IPAddress -ErrorAction SilentlyContinue
    $MacAddress = $Neighor.LinkLayerAddress

    Write-Host "Fatbox: $FatboxName, IP: $IPAddress, MAC: $MacAddress"

}
