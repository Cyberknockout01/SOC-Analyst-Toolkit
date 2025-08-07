Get-NetTCPConnection | 
Where-Object {$_.State -eq "Established"} |
Select-Object -Property LocalAddress, LocalPort, RemoteAddress, RemotePort, State, OwningProcess |
ForEach-Object {
    $proc = Get-Process -Id $_.OwningProcess -ErrorAction SilentlyContinue
    [PSCustomObject]@{
        ProcessName = $proc.ProcessName
        PID = $_.OwningProcess
        LocalAddress = $_.LocalAddress
        RemoteAddress = $_.RemoteAddress
        RemotePort = $_.RemotePort
    }
}