
Add-PSSnapin VMware.VimAutomation.Core
$Cluster = "Lillehei - Dell PROD 01"
$Template = "# W2012R2STD (Preferred) #"
$VLAN = "VLAN52"
$Custom = "#_W2K8R2_and_WS2012_#"
$VMHost = Get-Cluster $Cluster | Get-VMHost | Sort-Object MemoryUsageGB -Descending | Select-Object -First 1
$Datastore = Get-Datastore -VMHost $VMHost | Where-Object { $_.Type -match "VMFS" } | Sort-Object FreeSpaceGB -Descending | Select-Object -First 1
$VMTemplate = Get-Datacenter -VMHost $VMHost | Get-Template -Name $Template
$VNetwork = Get-VirtualPortGroup -VMHost $VMHost -Name vDS_$VLAN*
$VMName = "don-test"

New-VM -VMHost $VMHost -Datastore $Datastore -Name $VMName -Template $VMTemplate -OSCustomizationSpec $Custom

Get-VM $VMName | Get-NetworkAdapter | Set-NetworkAdapter -NetworkName $VNetwork -Confirm:$false