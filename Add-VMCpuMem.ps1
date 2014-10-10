$Name = "usxossql04"
$CPU = "4"
$Mem = "16"

$VM = Get-VM $Name

Shutdown-VMGuest -VM $VM -Confirm:$false

do {Write-Host "Waiting for " + $VM.Name + " to power off..."; $PowerState = (Get-VM $Name).PowerState}
until ($PowerState -match "PoweredOff")

Set-VM -VM $VM -NumCpu $CPU -MemoryGB $Mem -Confirm:$false

Start-VM -VM $VM -Confirm:$false