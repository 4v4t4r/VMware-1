

$VMhost = "usspdvmh01a.sjm.com" 
#$Oldvlan59 = "VLAN59" 
#$Newvlan59 = "vDS_VLAN59_DEV"

Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "VLAN13_std" } |Set-NetworkAdapter -NetworkName "vDS_VLAN13_DEV" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "VLAN14_std" } |Set-NetworkAdapter -NetworkName "vDS_VLAN14_DEV" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "VLAN18_std" } |Set-NetworkAdapter -NetworkName "vDS_VLAN18_DEV" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "VLAN22_std" } |Set-NetworkAdapter -NetworkName "vDS_VLAN22_DEV" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "VLAN31_std" } |Set-NetworkAdapter -NetworkName "vDS_VLAN31_DEV" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "VLAN35_std" } |Set-NetworkAdapter -NetworkName "vDS_VLAN35_DEV" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "VLAN4_std" } |Set-NetworkAdapter -NetworkName "vDS_VLAN4_DEV" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "VLAN5_std" } |Set-NetworkAdapter -NetworkName "vDS_VLAN5_DEV" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "VLAN57_std" } |Set-NetworkAdapter -NetworkName "vDS_VLAN57_DEV" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "VLAN58_std" } |Set-NetworkAdapter -NetworkName "vDS_VLAN58_DEV" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "VLAN59_std" } |Set-NetworkAdapter -NetworkName "vDS_VLAN59_DEV" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "VLAN6_std" } |Set-NetworkAdapter -NetworkName "vDS_VLAN6_DEV" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "VLAN8_std" } |Set-NetworkAdapter -NetworkName "vDS_VLAN8_DEV" -Confirm:$false