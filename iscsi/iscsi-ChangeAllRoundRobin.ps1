<#
    Get the iscsi LUN's that are not set to Round Robin for pathing policy and then change
    policy to use Round Robin on every LUN .
#>
Get-VMHost | Get-ScsiLun -LunType disk | Where {$_.MultipathPolicy -notlike "RoundRobin"} | 
Where {$_.CapacityGB -ge 100} | Set-Scsilun -MultiPathPolicy RoundRobin