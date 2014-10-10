$Cluster = "CRM Production"
$Report = "$Cluster-Migration.csv"
Write-Output "VM,PowerState,ConnectionTest,CurrentNetwork,NewNetwork,NetworkAdapter" > $Report

$VMs = Get-Cluster $Cluster | Get-VM
$VMs | ForEach-Object {
    $VMName = $_.Name
    $PowerState = $_.PowerState
    $VM = $_
    $VM | Get-NetworkAdapter | ForEach-Object {
        $Adapter = $_
        $AdapterName = $_.Name
        $NetworkName = $_.NetworkName
        Switch ($NetworkName) {
            vDS_VLAN13 {$NewNetwork = "VLAN13_std"}
            vDS_VLAN14 {$NewNetwork = "VLAN14_std"}
            vDS_VLAN16 {$NewNetwork = "VLAN16_std"}
            vDS_VLAN17 {$NewNetwork = "VLAN17_std"}
            vDS_VLAN18 {$NewNetwork = "VLAN18_std"}
            vDS_VLAN21 {$NewNetwork = "VLAN21_std"}
            vDS_VLAN22 {$NewNetwork = "VLAN22_std"}
            vDS_VLAN28 {$NewNetwork = "VLAN28_std"}
            vDS_VLAN29 {$NewNetwork = "VLAN29_std"}
            vDS_VLAN31 {$NewNetwork = "VLAN31_std"}
            vDS_VLAN33 {$NewNetwork = "VLAN33_std"}
            vDS_VLAN35 {$NewNetwork = "VLAN35_std"}
            vDS_VLAN36 {$NewNetwork = "VLAN36_std"}
            vDS_VLAN4 {$NewNetwork = "VLAN4_std"}
            vDS_VLAN5 {$NewNetwork = "VLAN5_std"}
            vDS_VLAN52 {$NewNetwork = "VLAN52_std"}
            vDS_VLAN57 {$NewNetwork = "VLAN57_std"}
            vDS_VLAN58 {$NewNetwork = "VLAN58_std"}
            vDS_VLAN59 {$NewNetwork = "VLAN59_std"}
            vDS_VLAN6 {$NewNetwork = "VLAN6_std"}
            vDS_VLAN7 {$NewNetwork = "VLAN7_std"}
            vDS_VLAN8 {$NewNetwork = "VLAN8_std"}
            vDS_DMZ_VLAN128 {$NewNetwork = "VLAN128_std"}
            vDS_DMZ_VLAN130 {$NewNetwork = "VLAN130_std"}
            vDS_DMZ_VLAN100 {$NewNetwork = "VLAN100_std"}
            vDS_DMZ_VLAN224 {$NewNetwork = "VLAN224_std"}
            vDS_DMZ_VLAN224 {$NewNetwork = "VLAN224_std"}
            "VLAN14-MES (Prod)" {$NewNetwork = "VLAN14_std"}
            "VLAN20-MES (Prod)" {$NewNetwork = "VLAN20_std"}
            "VLAN225-Exchange" {$NewNetwork = "VLAN225_std"}
            "VLAN22-Prod" {$NewNetwork = "VLAN22_std"}
            "VLAN230-Prod" {$NewNetwork = "VLAN230_std"}
            "VLAN231-Prod" {$NewNetwork = "VLAN231_std"}
            "VLAN234-Prod" {$NewNetwork = "VLAN234_std"}
            "VLAN237-Prod" {$NewNetwork = "VLAN237_std"}
            "VLAN30-Prod" {$NewNetwork = "VLAN30_std"}
            "VLAN44-Build (Prod)" {$NewNetwork = "VLAN44_std"}
            "VLAN45-Prod" {$NewNetwork = "VLAN45_std"}
            "VLAN4-Prod" {$NewNetwork = "VLAN4_std"}
            "VLAN506-GEMS" {$NewNetwork = "VLAN506_std"}
            "VLAN5-Prod" {$NewNetwork = "VLAN5_std"}
            "VLAN8-Prod" {$NewNetwork = "VLAN8_std"}
            "VLAN811-ISX_Stub" {$NewNetwork = "VLAN811_std"}
            "DMZ-VLAN200" {$NewNetwork = "VLAN200_std"}
            "DMZ-VLAN202" {$NewNetwork = "VLAN202_std"}
            "DMZ-VLAN212" {$NewNetwork = "VLAN212_std"}
            "DMZ-VLAN224" {$NewNetwork = "VLAN224_std"}
            default {$NewNetwork = $null}

        }
        If ($NewNetwork -eq $null){Write-Host "$VMName already on standard switch $NetworkName"}
        Else {
        Set-NetworkAdapter -NetworkAdapter $Adapter -NetworkName $NewNetwork -Confirm:$false > $null
        $Up = Test-Connection -Quiet -Count 2 $VMName
        Write-Output "$VMName,$PowerState,$Up,$NetworkName,$NewNetwork,$AdapterName" >> $Report
        $Output = Import-Csv $Report
        $Output | Select -Last 1 | Format-Table -AutoSize
        }
    }
}
