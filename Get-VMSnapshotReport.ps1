$Report = "SnapshotReport.html"
$CurrentDate = Get-Date
$Creds = Get-Credential
$VCConnection = Connect-VIServer uspychspvcs01.chs.com -Credential $Creds


Write-Output "<table border=1 cellpadding=5 bordercolor=#006c56>
    <tr>
    <th colspan=2><FONT COLOR=#006c56><FONT FACE=Arial, sans-serif><FONT SIZE=2 STYLE=font-size: 14pt><B>On-Call Schedule</B></FONT></FONT></FONT></th>
    </tr>
    <tr>
    <th><FONT COLOR=#006c56><FONT FACE=Arial, sans-serif><FONT SIZE=2 STYLE=font-size: 11pt><B>VM</B></FONT></FONT></FONT></th>
    <th><FONT COLOR=#006c56><FONT FACE=Arial, sans-serif><FONT SIZE=2 STYLE=font-size: 11pt><B>Name</B></FONT></FONT></FONT></th>
    <th><FONT COLOR=#006c56><FONT FACE=Arial, sans-serif><FONT SIZE=2 STYLE=font-size: 11pt><B>Description</B></FONT></FONT></FONT></th>
    <th><FONT COLOR=#006c56><FONT FACE=Arial, sans-serif><FONT SIZE=2 STYLE=font-size: 11pt><B>Days Old</B></FONT></FONT></FONT></th>
    <th><FONT COLOR=#006c56><FONT FACE=Arial, sans-serif><FONT SIZE=2 STYLE=font-size: 11pt><B>Created</B></FONT></FONT></FONT></th>
    <th><FONT COLOR=#006c56><FONT FACE=Arial, sans-serif><FONT SIZE=2 STYLE=font-size: 11pt><B>SizeGB</B></FONT></FONT></FONT></th>
    </tr>" > $Report

Get-VM | Get-Snapshot | ForEach-Object {
    $VM = $_.VM
    $Name = $_.Name
    $Description = $_.Description
    $Created = $_.Created
    $SizeGB = $_.SizeGB
    $DaysOld = (New-TimeSpan -Start $Created -End $CurrentDate).Days
    if ($DaysOld -gt 60){
        Write-Output "<tr>
            <td ALIGN=center><FONT FACE=Arial, sans-serif><FONT SIZE=2 STYLE=font-size: 11pt>$VM</FONT></FONT></P></td>
            <td ALIGN=center><FONT FACE=Arial, sans-serif><FONT SIZE=2 STYLE=font-size: 11pt>$Name</FONT></FONT></P></td>
            <td ALIGN=center><FONT FACE=Arial, sans-serif><FONT SIZE=2 STYLE=font-size: 11pt>$Description</FONT></FONT></P></td>
            <td ALIGN=center><FONT FACE=Arial, sans-serif><FONT SIZE=2 STYLE=font-size: 11pt>$DaysOld</FONT></FONT></P></td>
            <td ALIGN=center><FONT FACE=Arial, sans-serif><FONT SIZE=2 STYLE=font-size: 11pt>$Created</FONT></FONT></P></td>
            <td ALIGN=center><FONT FACE=Arial, sans-serif><FONT SIZE=2 STYLE=font-size: 11pt>$SizeGB</FONT></FONT></P></td>
            </tr>" >> $Report
    }
    Else {Write-Output "Do nothing..." > $null}
}

Send-MailMessage -Subject $Subject -To dlewis@sjm.com -From chs-noreply@chs.com -Body (Get-Content $Report | Out-String) -BodyAsHtml

Disconnect-VIServer $VCConnection.Id -Confirm:$false