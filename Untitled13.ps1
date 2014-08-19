$vms = Get-Content vms.txt
$temp = "temp.csv"

Write-Output "Name,Host,Cluster" > $temp

ForEach ($vm in $vms) {
    $data = Get-VM $vm
    $Name = $data.Name
    $VMHost = $data.VMHost.Name
    $Cluster = $data.VMHost.Parent
    Write-Output "$Name,$VMHost,$Cluster" >> $Temp
}

$Output = Import-Csv $temp
$Output