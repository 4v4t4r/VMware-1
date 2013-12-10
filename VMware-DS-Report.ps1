$Date = Get-Date -uformat "%d%m%Y"
$File = "~/Reports/USSY-Datastore-Report-" + $Date + ".csv"

echo "ClusterName`tDSName`tCapacityGB`tFreeSpaceGB`tUsedSpaceGB`tUncommittedGB`tProvisionedGB`tPercentOverProvisioned" > $File

Get-Cluster | ForEach-Object {
	$Cluster = $_
	$Cluster | Get-VMHost | Get-Datastore | Where-Object {$_.Name -notlike "*local"} | Get-View | Select -ExpandProperty Summary | Where-Object {$_.Type -Like "VMFS"} | ForEach-Object {
		$ClusterName = $Cluster
		$DSName = $_.Name
		$CapacityGB = ($_.Capacity / 1000000000).tostring("F02")
		$FreeSpaceGB = ($_.FreeSpace / 1000000000).tostring("F02")
		$UsedSpaceGB = (($_.Capacity - $_.FreeSpace) / 1000000000).tostring("F02")
		$UncommittedGB = ($_.Uncommitted /1000000000).tostring("F02")
		$ProvisionedGB = (($_.Capacity - $_.FreeSpace + $_.Uncommitted)/1000000000).tostring("F02")
		$PercentOverProvisioned = (($ProvisionedGB / $CapacityGB) * 100).tostring("F02")
		echo "$ClusterName`t$DSName`t$CapacityGB`t$FreeSpaceGB`t$UsedSpaceGB`t$UncommittedGB`t$ProvisionedGB`t$PercentOverProvisioned"
		} >> $File
	}