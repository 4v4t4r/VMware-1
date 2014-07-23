$VMhost = "ussppvmh02a.sjm.com" 
#$Oldvlan59 = "VLAN59" 
#$Newvlan59 = "vDS_VLAN59_PROD"

Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "vDS_VLAN13_PROD" } |Set-NetworkAdapter -NetworkName "VLAN13" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "vDS_VLAN14_PROD" } |Set-NetworkAdapter -NetworkName "VLAN14" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "vDS_VLAN16_PROD" } |Set-NetworkAdapter -NetworkName "VLAN16" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "vDS_VLAN18_PROD" } |Set-NetworkAdapter -NetworkName "VLAN18" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "vDS_VLAN21_PROD" } |Set-NetworkAdapter -NetworkName "VLAN21" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "vDS_VLAN22_PROD" } |Set-NetworkAdapter -NetworkName "VLAN22" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "vDS_VLAN28_PROD" } |Set-NetworkAdapter -NetworkName "VLAN28" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "vDS_VLAN29_PROD" } |Set-NetworkAdapter -NetworkName "VLAN29" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "vDS_VLAN31_PROD" } |Set-NetworkAdapter -NetworkName "VLAN31" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "vDS_VLAN35_PROD" } |Set-NetworkAdapter -NetworkName "VLAN35" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "vDS_VLAN4_PROD" } |Set-NetworkAdapter -NetworkName "VLAN4" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "vDS_VLAN5_PROD" } |Set-NetworkAdapter -NetworkName "VLAN5" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "vDS_VLAN52_PROD" } |Set-NetworkAdapter -NetworkName "VLAN52" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "vDS_VLAN53_PROD" } |Set-NetworkAdapter -NetworkName "VLAN53" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "vDS_VLAN57_PROD" } |Set-NetworkAdapter -NetworkName "VLAN57" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "vDS_VLAN58_PROD" } |Set-NetworkAdapter -NetworkName "VLAN58" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "vDS_VLAN59_PROD" } |Set-NetworkAdapter -NetworkName "VLAN59" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "vDS_VLAN6_PROD" } |Set-NetworkAdapter -NetworkName "VLAN6" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "vDS_VLAN8_PROD" } |Set-NetworkAdapter -NetworkName "VLAN8" -Confirm:$false