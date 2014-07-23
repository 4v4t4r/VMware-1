

$VMhost = "ussppvmh02a.sjm.com" 
#$Oldvlan59 = "VLAN59" 
#$Newvlan59 = "vDS_VLAN59_PROD"

Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "VLAN13" } |Set-NetworkAdapter -NetworkName "vDS_VLAN13_PROD" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "VLAN14" } |Set-NetworkAdapter -NetworkName "vDS_VLAN14_PROD" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "VLAN16" } |Set-NetworkAdapter -NetworkName "vDS_VLAN16_PROD" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "VLAN18" } |Set-NetworkAdapter -NetworkName "vDS_VLAN18_PROD" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "VLAN21" } |Set-NetworkAdapter -NetworkName "vDS_VLAN21_PROD" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "VLAN22" } |Set-NetworkAdapter -NetworkName "vDS_VLAN22_PROD" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "VLAN28" } |Set-NetworkAdapter -NetworkName "vDS_VLAN28_PROD" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "VLAN29" } |Set-NetworkAdapter -NetworkName "vDS_VLAN29_PROD" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "VLAN31" } |Set-NetworkAdapter -NetworkName "vDS_VLAN31_PROD" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "VLAN35" } |Set-NetworkAdapter -NetworkName "vDS_VLAN35_PROD" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "VLAN4" } |Set-NetworkAdapter -NetworkName "vDS_VLAN4_PROD" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "VLAN5" } |Set-NetworkAdapter -NetworkName "vDS_VLAN5_PROD" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "VLAN52" } |Set-NetworkAdapter -NetworkName "vDS_VLAN52_PROD" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "VLAN53" } |Set-NetworkAdapter -NetworkName "vDS_VLAN53_PROD" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "VLAN57" } |Set-NetworkAdapter -NetworkName "vDS_VLAN57_PROD" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "VLAN58" } |Set-NetworkAdapter -NetworkName "vDS_VLAN58_PROD" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "VLAN59" } |Set-NetworkAdapter -NetworkName "vDS_VLAN59_PROD" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "VLAN6" } |Set-NetworkAdapter -NetworkName "vDS_VLAN6_PROD" -Confirm:$false
Get-VMhost $VMhost |Get-VM |Get-NetworkAdapter |Where {$_.NetworkName -eq "VLAN8" } |Set-NetworkAdapter -NetworkName "vDS_VLAN8_PROD" -Confirm:$false