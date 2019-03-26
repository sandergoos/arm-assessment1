### Define Deployment Variables
{
$location = 'West Europe'
$resourceGroupName = 'sander-arm-template'
$resourceDeploymentName = 'sander-arm-template-deployment'
$templatePath = $env:SystemDrive + '\' + 'Projects\arm-assessment1'
$templateFile = 'template.json'
$template = $templatePath + '\' + $templateFile
$templateParameterfile = $templatePath + '\' + 'template.parameter.json'
$password = "Sander@Passw0rd"
$securePassword = $password | ConvertTo-SecureString -AsPlainText -Force
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
$additionalParameters = New-Object -TypeName Hashtable
$additionalParameters['vmPrivateAdminPassword'] = $securePassword

New-AzureRmResourceGroupDeployment `
    -Name $resourceDeploymentName `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile $template `
    -TemplateParameterFile $templateParameterfile
    -DeploymentDebugLogLevel All `
    -Verbose -Force
}