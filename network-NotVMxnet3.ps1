<#
    This script will retreive all of the network adapters and ouput (optionally)
    to a file of your choosing.
#>
Get-VM | Get-NetworkAdapter | 
Where-object {$_.Type -ne "Vmxnet3"} | 
Select @{N="VM";E={$_.Parent.Name}},Name,Type

#Remove the line to export to a csv file, otherwise it will print to screen
 #| export-Csv  c:\Network_Interface.csv -NoTypeInformation