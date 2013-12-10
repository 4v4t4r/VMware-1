Function Collect-Data {

    $ASKCLUSTER = Read-Host "Enter cluster name"
    $ASKSRCDATASTORE = Read-Host "Enter common naming parameter of source datastores"
    $ASKDESTDATASTORE = Read-Host "Enter common naming parameter of destination datastores"
    $NUMBEROFVMOTIONS = Read-Host "Enter number of simultaneous vmotions"
    $CLUSTER = Get-Cluster "*$ASKCLUSTER*"
    $SRCDATASTORE = Get-Cluster "$CLUSTER" | Get-VMHost | Get-Datastore "*$ASKSRCDATASTORE*"
    $DESTDATASTORE = Get-Cluster "$CLUSTER" | Get-VMHost | Get-Datastore "*$ASKDESTDATASTORE*"

# Confirm Value
Write-Output "
Confirm the values entered
Cluster Name:
-------------"
Write-Output $CLUSTER

Write-Output "
Source Datastores:
------------------"
Write-Output $SRCDATASTORE.Name

Write-Output "
Destination Datastores:
-----------------------"
Write-Output $DESTDATASTORE.Name

Write-Output "
Number of Simultaneous vMotions:
--------------------------------
$NUMBEROFVMOTIONS"

$CONFIRM = Read-Host "Does this look right?"

if ("$CONFIRM" -eq "Yes" -or "$CONFIRM" -eq "y"){Write-Host "It Works!"}
else {Write-Host "Incorrect Repsone."; Collect-Data}
}
#$VMS = Get-Cluster "$ASKCLUSTER" | Get-VMHost | Get-Datastore "$ASKSRCDATASTORE" | Get-VM



#ForEach ($VM in $VMS) {
#    $DATASTORE = Get-Cluster "Scottsdale Production" | Get-VMHost | Get-Datastore HDS* | Sort-Object FreeSpaceGB -Descending | Select-Object -First 1
#    $SPACE = [System.Math]::Round($DATASTORE.FreeSpaceGB, 2)
#    Write-Host "Moving $VM to $DATASTORE with $SPACE GB of free space."
#    Move-VM $VM -Datastore $DATASTORE -Confirm:$FALSE
#    }

Collect-Data