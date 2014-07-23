param (
    
    [Parameter(Position=0)]
    [String]$Cluster = $Null,
	[String]$VIServer = $Null
	)

If ($Cluster -eq "" -and $VIServer -eq ""){Write-Host "Getting HBA information for all hosts..."; $VMHosts = Get-Cluster | Get-VMHost}
ElseIf ($Cluster -ne "" -and $VIServer -eq ""){Write-Host "Getting HBA information for all hosts in cluster $Cluster..."; $VMHosts = Get-Cluster -Name $Cluster | Get-VMHost}
ElseIf ($Cluster -eq "" -and $VIServer -ne ""){Write-Host "Getting HBA information for all hosts in VCenter $VIServer..."; $VMHosts = Get-Cluster -Server $VIServer | Get-VMHost}
Else { Write-Host "Getting HBA information for all hosts in cluster $Cluster in VCenter $VIServer"; $VMHosts = Get-Cluster $Cluster -Server $VIServer | Get-VMHost;}
$result = @()
 
foreach ($VMHost in $VMHosts | Sort-Object -Property Name) {
    Write-Host "Checking" $VMHost.Name
 
    $VMHost.ExtensionData.Config.StorageDevice.ScsiTopology.Adapter |?{ $_.Adapter -like "*FibreChannelHba*" } | %{
        $hba = $_.Adapter.Split("-")[2]
 
        $active = 0
        $standby = 0
        $dead = 0
 
        $_.Target | %{ 
            $_.Lun | %{
                $id = $_.ScsiLun
 
                $multipathInfo = $VMHost.ExtensionData.Config.StorageDevice.MultipathInfo.Lun | ?{ $_.Lun -eq $id }
 
                $a = [ARRAY]($multipathInfo.Path | ?{ $_.PathState -like "active" })
                $s = [ARRAY]($multipathInfo.Path | ?{ $_.PathState -like "standby" })
                $d = [ARRAY]($multipathInfo.Path | ?{ $_.PathState -like "dead" })
 
                $active += $a.Count
                $standby += $s.Count
                $dead += $d.Count
            }
        }
 
        $result += "{0},{1},{2},{3},{4}" -f $VMHost.Name.Split(".")[0], $hba, $active, $dead, $standby
    }
}
 
ConvertFrom-Csv -Header "VMHost", "HBA", "Active", "Dead", "Standby" -InputObject $result | ft -AutoSize