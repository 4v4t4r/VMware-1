$VCenterServer = "ussypvcs04.ad.sjm.com"
$File = "C:\Users\lewisd01\temp\MIR-Server-Patching-121114"
$Servers = Get-Content $File
$SnapshotName = "Before_Patching_121114"
$SnapshotDescription = "Snapshot of servers before patches (DWL 12/11/2014)"
$VCenterConnection = Connect-VIServer $VCenterServer

ForEach($Server in $Servers) {
    Get-VM $Server | New-Snapshot -Name $SnapshotName -Description $SnapshotDescription -Quiesce -RunAsync -Confirm:$false
}

Disconnect-VIServer $VCenterConnection.Id -Confirm:$false