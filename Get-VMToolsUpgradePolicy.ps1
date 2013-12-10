

$Report = "Tools-Upgrade-On-Boot-Report.csv"

Write-Output "VMName,OS,ToolsUpgradePolicy" > $Report

Get-Cluster | Where-Object {$_.Name -notlike "Merlin*"} | Get-VM | ForEach-Object {
    $VM = $_.Name
    $OS = $_.Guest.OsFullName
    $ToolsPolicy = $_.ExtensionData.Config.Tools.ToolsUpgradePolicy
    Write-Output "$VM,$OS,$ToolsPolicy" >> $Report
    }