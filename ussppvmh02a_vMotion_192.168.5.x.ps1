$vmhost = "ussppvmh02a.sjm.com"
$192_168_5 = "vmk2"
$192_168_6 = "vmk1"
Get-VMHost $vmhost | Get-VMHostNetworkAdapter -Name $192_168_6 | Set-VMHostNetworkAdapter -VMotionEnabled $false -Confirm:$false
Get-VMHost $vmhost | Get-VMHostNetworkAdapter -Name $192_168_5 | Set-VMHostNetworkAdapter -VMotionEnabled $true -Confirm:$false
