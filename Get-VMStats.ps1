#Connect-VIServer <server> -User <user> -Password <password>
$Date = Get-Date -Format MMddyy-HHmmss
$allvms = @()
$vms = @("ussppapp12","usc1papp10","ussppweb01","usc1pweb01","ussppapp11","usc1papp11","ussppapp16")
 
$stats = Get-Stat -Entity $vms -start (get-date).AddMinutes(-15) -Finish (Get-Date) -stat "cpu.usage.average","mem.usage.average"  
$stats | Group-Object -Property Entity | %{
  $vmstat = "" | Select VmName, MemMax, MemAvg, MemMin, CPUMax, CPUAvg, CPUMin
  $vmstat.VmName = $_.name
 
  $cpu = $_.Group | where {$_.MetricId -eq "cpu.usage.average"} | Measure-Object -Property value -Average -Maximum -Minimum
  $mem = $_.Group | where {$_.MetricId -eq "mem.usage.average"} | Measure-Object -Property value -Average -Maximum -Minimum
 
  $vmstat.CPUMax = [int]$cpu.Maximum
  $vmstat.CPUAvg = [int]$cpu.Average
  $vmstat.CPUMin = [int]$cpu.Minimum
  $vmstat.MemMax = [int]$mem.Maximum
  $vmstat.MemAvg = [int]$mem.Average
  $vmstat.MemMin = [int]$mem.Minimum  
  $allvms += $vmstat
}
$allvms | Select VmName, MemMax, MemAvg, MemMin, CPUMax, CPUAvg, CPUMin | Export-Csv "c:\temp\Project_ReOrg_VMs-$Date.csv" -noTypeInformation
