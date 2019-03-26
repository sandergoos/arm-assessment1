### Define Deployment Variables
{
$location = 'West Europe'
$resourceGroupName = 'sander-arm-template'
$resourceDeploymentName = 'sander-arm-template-deployment'
$templatePath = $env:SystemDrive + '\' + 'Projects\arm-assessment1'
$templateFile = 'arm-template.json'
$template = $templatePath + '\' + $templateFile
$templateParameterfile = $templatePath + '\' + 'arm-template.parameters.json'
$objectId = "9053ded9-aa08-44da-b328-ce98597de522"
}

### Create Resource Group
{
New-AzureRmResourceGroup `
    -Name $resourceGroupName `
    -Location $location `
    -Verbose -Force
}

### Deploy Resources
{

New-AzureRmResourceGroupDeployment `
    -Name $resourceDeploymentName `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile $template `
    -TemplateParameterFile $templateParameterfile `
    -DeploymentDebugLogLevel All `
    -objectId $objectId `
    -Verbose -Force
}