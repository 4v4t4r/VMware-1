$VDSwitch = "vDS_USSP_Dev"
$VDPortGroup = "vDS_VLAN58_DEV"
$NewNetwork = "VLAN58_std"

Get-VDSwitch $VDSwitch | Get-VDPortgroup $VDPortGroup | Get-NetworkAdapter | ForEach-Object {
    $VMName = $_.Parent
    $AdapterName = $_.Name
    $Mac = $_.MacAddress
    $NetName = $_.NetworkName
    $PowerState = (Get-VM $VMName).PowerState
    Write-Host "Changing $AdapterName ($Mac) on $VMName from $VDPortGroup to $NewNetwork"
    $_ | Set-NetworkAdapter -NetworkName $NewNetwork -Confirm:$false
    $Up = Test-Connection $VMName -Quiet -Count 2
    Write-Host "$VMName   $PowerState   $Up"
    }

##vDS_VLAN57_DEV                 254      Static     
##vDS_VLAN35_DEV                 254      Static     
##vDS_VLAN4_DEV                  254      Static     
##vDS_VLAN31_DEV                 254      Static     
##vDS_VLAN5_DEV                  254      Static     
##vDS_VLAN22_DEV                 254      Static          
##vDS_VLAN8_DEV                  254      Static     
##vDS_VLAN18_DEV                 254      Static     
##vDS_VLAN6_DEV                  254      Static     
##vDS_VLAN13_DEV                 254      Static     
##vDS_VLAN59_DEV                 254      Static     
##vDS_VLAN14_DEV                 254      Static     
##vDS_VLAN58_DEV                 254      Static 