$TestVM = Get-VM vlan_connectivity_test
$VMHosts = "usscpvmh01a.sjm.com","usscpvmh01b.sjm.com","usscpvmh01c.sjm.com"
$Report = "temp.csv"

Write-Output "Host,Network Name,VLAN ID,IP Address,Status" > $Report

do {$TestVM = Get-VM vlan_connectivity_test

ForEach ($VMHost in $VMHosts) {

    Write-Host "Testing Connectivity on Host $VMHost"

    Write-Host "Moving Test VM to $VMHost"

    $GetSubnet = Get-VMHost $VMHosts | Get-VMHostNetworkAdapter -Name vmk0
    $Subnet = ($GetSubnet.IP.Split(".")[0])+"."+($GetSubnet.IP.Split(".")[1]+".")

    $TestVM | Move-VM -Destination $VMHost > $null

    $VLANs = Get-VMHost $VMHost | Get-VirtualPortGroup | Where {$_.Port -eq $null}

    $VLANs | ForEach-Object {
        $VLAN = $_.VLanId
        $VLANName = $_.Name
        #$Subnet = "10.1."
        $Gateway = $Subnet+$VLAN+".1"
        $Netmask = "255.255.255.0"
        $IPAddress = $null
        $Octet = 200

        Write-Host "Testing Network $VLANName on $VMHost"

        $TestVM | Get-NetworkAdapter | Set-NetworkAdapter -NetworkName $VLANName -Confirm:$false > $null

        do {
            if ($IPAddress -eq $null) {Write-Host "Determining IP address available in VLAN $VLAN"; $Octet++; $IPAddress = $Subnet+$VLAN+"."+$Octet}
            else {Write-Host "$IPAddress is in use..."; $Octet++ ; $IPAddress = $Subnet+$VLAN+"."+$Octet ;}
        }
        While ((Test-Connection -Count 2 $IPAddress -Quiet) -eq $true)

        Write-Host "Using $IPAddress"

        Write-Host "Changing VMs IP to $IPAddress and Gateway to $Gateway"

        $TestVM | Invoke-VMScript -ScriptText "ifconfig eth0 $IPAddress netmask $Netmask up" -ScriptType Bash -GuestUser root -GuestPassword vl@nt3sting > $null
        $TestVM | Invoke-VMScript -ScriptText "route add default gw $Gateway eth0" -ScriptType Bash -GuestUser root -GuestPassword vl@nt3sting > $null

        Start-Sleep -Seconds 5

        if ((Test-Connection $IPAddress -Count 2 -Quiet) -eq $true){Write-Host "Pass!"; $Status = "Pass"}
        else {Write-Host "Fail!"; $Status = "Fail"}

        $TestVM | Invoke-VMScript -ScriptText "route del default gw $Gateway eth0" -ScriptType Bash -GuestUser root -GuestPassword vl@nt3sting > $null

        Write-Output "$VMHost,$VLANName,$VLAN,$IPAddress,$Status" >> $Report
    }
}

$TestVM | Shutdown-VMGuest

$Output = Import-Csv $Report
$Output | Format-Table -AutoSize