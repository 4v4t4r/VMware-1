$a = (Get-VDPortgroup -VDSwitch vDS_USSP_Prod -Server ussppvcs05.ad.sjm.com | Where-Object {$_.IsUplink -eq $false}).ExtensionData.Config.DefaultPortConfig.Vlan.VlanId

Get-VDPortgroup -VDSwitch vDS_USSP_Dev -Server ussppvcs05.ad.sjm.com | Where-Object {$_.IsUplink -eq $false} | ForEach-Object {
    if ($a -notcontains $_.ExtensionData.Config.DefaultPortConfig.Vlan.VlanId){Write-Host "Missing VLAN" $_.Name}
    Else {$null}
    }

