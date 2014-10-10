$NewVC = "ussppvcs05.ad.sjm.com"
$OldVC = "ussppvvc01.ad.sjm.com"
$OldSwitch = "vDS_USXO_DMZ"
$NewSwitch = "vDS_USXO_DMZ"
$Environment = "_DMZ"
$Site = "USXO"

Get-VDSwitch -Name $OldSwitch -Server $OldVC | Get-VDPortgroup | Where-Object {$_.IsUplink -eq $false} | ForEach-Object {
    $VLAN = $_.ExtensionData.Config.DefaultPortConfig.Vlan.VlanId
    $Name = "VLAN" + $VLAN + "_" + $Site + $Environment
    $Ports = 256
    Write-Host "Creating PortGroup $Name with VLANID $VLAN and $Ports Ports"
    Get-VDSwitch -Name $NewSwitch -Server $NewVC | New-VDPortgroup -Name $Name -VlanId $VLAN -NumPorts $Ports -Server $NewVC
    }