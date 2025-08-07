# Monitor failed login attempts
Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4625} -MaxEvents 10 | 
Select-Object TimeCreated, Message | 
Format-List