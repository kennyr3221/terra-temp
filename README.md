This is a Template Repository for use with a devcontainer.  When creating a new Terraform project use this as the template.

1. Create a repository using the tenmplate repo as the base
2. Create a development branch based on main
3. Using Terraform be able to build the following: 
 - Azure Resource Group
- Azure Network
- Azure Subnet(s)
- Network Security Groups
- KeyVault on top of NSG
- Bastion Host
- Ububtu Virtual Machine on Private endpoint behind Bastion
- App Service Plan
- App Service(s)
- Open communication from Bastion to Virtual Machine Subnet
- Deploy hello world application to App Service Slot
- Log Analytics Workspace
- Application Insights ( ship logs to the log analytics workspace )
- Azure Storage ( used for manageing Terraform State )\
- Azure Blob Container Used for TFLOC file
- Azure Function 
- Azure KeyVault 
- 

Goal of this project:
The infrastructure should support a application that is auto-scalable and monitors key metrics.  The app is a Point of Sale system that could have anywhere between 10 to 5000 users and should scale to support and scale down. Also all file structures should follow the same naming schemna.  
