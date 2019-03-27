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
$password = ConvertTo-SecureString "P@ssW0rD!" -AsPlainText -Force

### Define additional template parameters
$additionalParameters = New-Object -TypeName Hashtable
$additionalParameters['adminPassword'] = $password
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
    -DeploymentDebugLogLevel All `
    -objectId $objectId `
     @additionalParameters `
    -Verbose -Force
}