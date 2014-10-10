$Servers = @("USXOSWEB01","USXOSWEB02","USXOSSBL01","USXOSSBL02","USXOSSBL03","USXOSSBL04")
$DriveLetter = "F"

$ScriptBlock = {
    $Disk = Get-Disk | Where-Object {$_.IsOffline -eq $true}
    Initialize-Disk -Number $Disk.Number -Confirm:$false
    New-Partition -DiskNumber 2 -UseMaximumSize -DriveLetter $DriveLetter
    Format-Volume -DriveLetter $DriveLetter -NewFileSystemLabel Temp_Storage -Confirm:$false
    }

ForEach ($Server in $Servers) {

Invoke-Command -ComputerName $Server -ScriptBlock $ScriptBlock

}