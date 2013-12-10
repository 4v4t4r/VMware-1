$results=Read-Host "Please enter in a Virtual Machine Name or specify a text file with a list of VM's" 

if (Test-Path $results) {
	$computernames = Get-Content $results
}   else {
	$computernames = $results
}
 $computernames

foreach ($virtualmachine in $computernames)

{
$vm = Get-VM -Name "$virtualmachine"
$spec = New-Object VMware.Vim.VirtualMachineConfigSpec
$spec.changeVersion = $vm.ExtensionData.Config.ChangeVersion
$spec.tools = New-Object VMware.Vim.ToolsConfigInfo
$spec.tools.toolsUpgradePolicy = "upgradeAtPowerCycle"
$_this = Get-View -Id $vm.Id
$_this.ReconfigVM_Task($spec)	
}
