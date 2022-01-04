write-host "The resource group name you want to create?"
$RGName = Read-Host

IF (!(Get-AzResourceGroup -Name $RGName)) {
    Write-Host "The location of $RGName?"
    $loc = Read-Host
    New-AzResourceGroup -Name $RGName -Location $loc -Force
}else {
    Write-Host "$RGName already exsits, do you want to deploy to this resource group?"
    Write-Host "[Y]es or [No]"
    $Sel = Read-Host

    Switch -Wildcard ($sel) {
        'Y*' {
            New-AzResourceGroupDeployment -ResourceGroupName $RGName -TemplateFile .\karlourVPNVNettemplate.json
        }
    }
}