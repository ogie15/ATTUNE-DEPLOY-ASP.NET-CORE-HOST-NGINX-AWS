## **Deploy-ASP.NET~\Core-Ubuntu~\Host-Nginx-AWS**
> #### **Region for ExecutionPolicy**
> - *The script above first gets the execution policy of the current PowerShell session.*
> 
> - *Then checks if it is set to Unrestricted.*
> 
> - *`If` it is set, then skips and echos a message to the screen.*
>
> - *`Else` it sets the execution policy to Unrestricted.*
> ---
> #### **Region Deploy Ubuntu Host For ASP.NET CORE with NGINX**
> 
> - *First the AWSPowerShell module is imported to the current session.*
> - *Then the values below are set:*
>
> > | Variable Name | Description | Value |
> > | :----: | :----: | :---: |
> > | AccessKeyValue | This is the AWS IAM User access key | {accesskey.value} |
> > | SecretKeyValue | This is the AWS IAM User secret key | {secretkey.value} |
> > | ProfileNameVaule | This holds the user defined AWS credentials | DefaultSetKeys |
> > | AWSImageId | This holds the AWS Image Id | ami-0244a5621d426859b |
> > | AWSInstanceType | This holds the AWS Instance Type | t2.micro |
> > | HashValue | This holds a hash table containing the Region where the VM is going to be deployed and KeyPair in AWS | {hashvalue.value} |
> > > ---
> > > #### *Below is a table explaining how to create the variables on Attune with matching data types:*
> > > ---
> > > | Vaule in script | Value Location in Attune | Parameter location in Attune| Data Type | Example |
> > > | :----: | :---: | :---: | :---: | :---: |
> > > | {accesskey.value} | (value) Inputs->Text Vaules->Variable | (access) Inputs->Text Vaules->Name | String | HKOPUHIVJOQQN3YNLCIL |
> > > | {secretkey.value} | (value) Inputs->Text Vaules->Variable | (secretkey) Inputs->Text Parameter->Name | String | MJYj7oBcNMTe+R+TTIWdQqXLYcttQ8IOwh1O9zH5 | 
> > > | {hashvalue.value} | (value) Inputs->Text Vaules->Variable | (hashvalue) Inputs->Text Parameter->Name | Hash Table | @{"Region" = "eu-west-2";"KeyPair" = "pemkeyname"} |
> > > > ---
> > > > The Hash Table holds the InstanceID with it's corresponding Region.
> > > > ##### *Hash Table Value Syntax:*
> > > > 
> > > > ```powershell
> > > > @{"Region" = "eu-west-2";"KeyPair" = "pemkeyname"}
> > > > ```
> > > > ##### *Next the UserDataText Variable is set*
> > > > ##### *UserDataText variable is a shell script as written below:*
> > > > ```bash
> > > > #!/bin/bash
> > > > wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
> > > > sudo dpkg -i packages-microsoft-prod.deb
> > > > sudo apt-get update; \
> > > > sudo apt-get install -y apt-transport-https && \
> > > > sudo apt-get install -y dotnet-sdk-5.0
> > > > sudo apt-get install -y dotnet-sdk-3.1
> > > > sudo apt-get install -y apt-transport-https && \
> > > > sudo apt-get install -y aspnetcore-runtime-5.0
> > > > sudo apt-get install -y aspnetcore-runtime-3.1
> > > > sudo apt-get install -y nginx
> > > > ```
> > > > ---
> > > ---
> - *Next the IAM AWS User credentials are set using the `Set-AWSCredential` CMDLET*
> - *__NOTE__: Ensure to edit the values of the parameters `AccessKey` and `SecretKey` in Attune to match the IAM user credentials with privileges to perform this operation*
> - *Next the Environment is deployed using the `New-EC2Instance` CMDLET*
> - *__NOTE__: The `Region` and `KeyPair` parameters are gotten from the Hash Table created in Attune and should not be left blank*
> - *Finally a CMDLET `Remove-AWSCredentialProfile` is run to remove the credential profile created in the session from the local credential store*
> ---
[![SERVERTRIBE](https://www.servertribe.com/wp-content/themes/mars/assets/images/attune_logo.svg)](https://www.servertribe.com/)
***&copy;2021 Powered by ServerTribe***