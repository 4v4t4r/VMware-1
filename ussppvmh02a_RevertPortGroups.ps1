$VMhost = "usspdvmh01c.sjm.com" 
#$Oldvlan59 = "VLAN59" 
#$Newvlan59 = "vDS_VLAN59_DEV"

Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "vDS_VLAN13_DEV" } |Set-NetworkAdapter -NetworkName "VLAN13_std" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "vDS_VLAN14_DEV" } |Set-NetworkAdapter -NetworkName "VLAN14_std" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "vDS_VLAN18_DEV" } |Set-NetworkAdapter -NetworkName "VLAN18_std" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "vDS_VLAN22_DEV" } |Set-NetworkAdapter -NetworkName "VLAN22_std" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "vDS_VLAN31_DEV" } |Set-NetworkAdapter -NetworkName "VLAN31_std" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "vDS_VLAN35_DEV" } |Set-NetworkAdapter -NetworkName "VLAN35_std" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "vDS_VLAN4_DEV" } |Set-NetworkAdapter -NetworkName "VLAN4_std" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "vDS_VLAN5_DEV" } |Set-NetworkAdapter -NetworkName "VLAN5_std" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "vDS_VLAN57_DEV" } |Set-NetworkAdapter -NetworkName "VLAN57_std" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "vDS_VLAN58_DEV" } |Set-NetworkAdapter -NetworkName "VLAN58_std" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "vDS_VLAN59_DEV" } |Set-NetworkAdapter -NetworkName "VLAN59_std" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "vDS_VLAN6_DEV" } |Set-NetworkAdapter -NetworkName "VLAN6_std" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "vDS_VLAN8_DEV" } |Set-NetworkAdapter -NetworkName "VLAN8_std" -Confirm:$false