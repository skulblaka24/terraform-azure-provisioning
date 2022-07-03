terraform-azure-provisioning
============================

Example to provision a vm on azure, some firewall rules and a webpage using home made modules.

Modify variables to use it.

Terraform Cloud deployment through Doormat:
-------------------------------------------

The doormat rights on a doormat account does not seem to work on Azure.

As an alternative, create your own account. Then
use the learn here to create Azure accounts: https://learn.hashicorp.com/tutorials/terraform/azure-build

1. Install azure-cli:
```
$ brew update && brew install azure-cli
```
2. Login to Azure (Your Browser will open):
```
$ az login
```
  --> Your browser will open and prompt you to enter your Azure login credentials. After successful authentication, your terminal will display your subscription information.

Output:
  You have logged in. Now let us find all the subscriptions to which you have access...
```
  [
    {
      "cloudName": "AzureCloud",
      "homeTenantId": "0envbwi39-home-Tenant-Id",
      "id": "35akss-subscription-id",
      "isDefault": true,
      "managedByTenants": [],
      "name": "Subscription-Name",
      "state": "Enabled",
      "tenantId": "0envbwi39-TenantId",
      "user": {
        "name": "your-username@domain.com",
        "type": "user"
      }
    }
  ]
```

3. Find the id column for the subscription account you want to use.
Once you have chosen the account subscription ID, set the account with the Azure CLI.
```
$ az account set --subscription "35akss-subscription-id"
```
4. Next, create a Service Principal. A Service Principal is an application within Azure Active Directory with the authentication tokens Terraform needs to perform actions on your behalf. Update the <SUBSCRIPTION_ID> with the subscription ID you specified in the previous step.
```
$ az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<SUBSCRIPTION_ID>"
```
Output:
  Creating 'Contributor' role assignment under scope '/subscriptions/35akss-subscription-id'
  The output includes credentials that you must protect. Be sure that you do not include these credentials in your code or check the credentials into your source control. For more information, see https://aka.ms/azadsp-cli
```
  {
    "appId": "xxxxxx-xxx-xxxx-xxxx-xxxxxxxxxx",
    "displayName": "azure-cli-2022-xxxx",
    "password": "xxxxxx~xxxxxx~xxxxx",
    "tenant": "xxxxx-xxxx-xxxxx-xxxx-xxxxx"
  }
```
5. Environment variables to add to TFC:
No Terraform variables, environment !
```
  $ export ARM_CLIENT_ID="<APPID_VALUE>"
  $ export ARM_CLIENT_SECRET="<PASSWORD_VALUE>"
  $ export ARM_SUBSCRIPTION_ID="<SUBSCRIPTION_ID>"
  $ export ARM_TENANT_ID="<TENANT_VALUE>"
```
Those should be tagged as Sensitive !

Variables required:
-------------------
```
linux_password = ""
```
