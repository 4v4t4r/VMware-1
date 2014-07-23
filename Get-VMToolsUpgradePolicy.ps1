Add-PSSnapin VMware.VimAutomation.Core
Add-PSSnapin VMware.DeployAutomation

$Site = $env:COMPUTERNAME.Substring(0, 4)
$Date = Get-Date -Format yyyyMMdd
$Report = "Tools-Upgrade-On-Boot-Report-$Date.csv"
$VCenters = @("ussppvvc01.ad.sjm.com","ussypvcs04.ad.sjm.com","bebrpvcs05.ad.sjm.com")
$Credentials = Get-Credential

Switch ($Site)
{
	USSP { Connect-VIServer ussppvvc01.ad.sjm.com -AllLinked -Credential $Credentials }
	USSY { Connect-VIServer ussypvcs04.ad.sjm.com -AllLinked -Credential $Credentials }
	BEBR { Connect-VIServer bebrpvcs05.ad.sjm.com -AllLinked -Credential $Credentials }
}

Write-Output "VMName,OS,ToolsUpgradePolicy,VCenter" > $Report

ForEach ($VCenter in $VCenters)
{
	Get-VM -Server $VCenter | Where-Object { $_.Guest.OsFullName -like "Microsoft Windows Server*" } | ForEach-Object {
		$VM = $_.Name
		$OS = $_.Guest.OsFullName
		$ToolsPolicy = $_.ExtensionData.Config.Tools.ToolsUpgradePolicy
		If ($ToolsPolicy -eq "upgradeAtPowerCycle") { Write-Output "Good to Go!" > $null }
		Else { Write-Output "$VM,$OS,$ToolsPolicy,$VCenter" >> $Report }
	}
	Disconnect-VIServer $VCenter -Confirm:$false
}