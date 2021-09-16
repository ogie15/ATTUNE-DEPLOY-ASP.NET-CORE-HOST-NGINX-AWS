#Region for ExecutionPolicy
# ===========================================================================
# Get Execution Policy of the current process
$Script:ProcessEP = Get-ExecutionPolicy -Scope Process

#Get the value of the Execution Policy and save it in the Variable
$Script:ValueProcessEP = ($Script:ProcessEP).value__

# Check if the Execution Policy of the process is set to Unrestricted
if ($Script:ValueProcessEP -eq 0) {

    # Write the message
    Write-Output "Execution Policy is already set to Unrestricted for the Process"
# Check if the Execution Policy of the process is already set
}else{

    # Set the ExecutionPolicy of the Process to Unrestricted
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force -Confirm:$false

    # Checks if the Execution Policy has been set
    if ((Get-ExecutionPolicy -Scope Process).value__ -eq 0) {

        # Write the message
        Write-Output "Execution Policy is now set to Unrestricted for the Process"
    }
}
# ===========================================================================
#EndRegion for ExecutionPolicy 




<<<<<<< HEAD
#Region to deploy Ubuntu Host For ASP.NET CORE with NGINX
=======
#Region to Deploy Ubuntu and install NGINX and DotNet Core
>>>>>>> 2bb0b6867cbfaa57f5d83f468bb773d3dd44dfed
# ===========================================================================
# Import Module for AWS PowerShell
Import-Module -Name AWSPowerShell

# # Save accesskey to this Variable
$Script:AccessKeyValue = "{accesskey.value}"

# # Save secretkey to this variable
$Script:SecretKeyValue = "{secretkey.value}"

# # Set value to store profile 
$Script:ProfileNameVaule = "DefaultSetKeys"

# Set the AWS Image ID
$Script:AWSImageId = "ami-0244a5621d426859b"

# Set the AWS Instance Type
$Script:AWSInstanceType = "t2.micro"

# # Hash Table of InstanceId with coressponding region pair
$Script:HashValue = {hashvalue.value}



# UserData script for DotNet and Nginx
$Script:UserDataText = "#!/bin/bash
wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update; \
sudo apt-get install -y apt-transport-https && \
sudo apt-get install -y dotnet-sdk-5.0
sudo apt-get install -y dotnet-sdk-3.1
sudo apt-get install -y apt-transport-https && \
sudo apt-get install -y aspnetcore-runtime-5.0
sudo apt-get install -y aspnetcore-runtime-3.1
sudo apt-get install -y nginx"



# Set AWS Credentials
Set-AWSCredential -AccessKey $Script:AccessKeyValue -SecretKey $Script:SecretKeyValue -StoreAs $Script:ProfileNameVaule



# check Hash Table
if ($null -eq $Script:HashValue['KeyPair'] -or $null -eq $Script:HashValue['Region']) {

    # Write the message
    Write-Output "Please check the Hash Table"
}else {

    # Write the message
    Write-Output "All keys are present in the Hash Table... checking keypair"

    # Checking KeyPair in hashtable
    if (!($Script:HashValue.ContainsKey('KeyPair')) -or $Script:HashValue.KeyPair -like "") {

        # Write the message
        Write-Output "KeyPair does not exist in the Hash Table or it is an empty string"

    }else {

        # Write the message
        Write-Output "Creating Ubuntu EC2 instance with NGINX and DOTNET Core"

        # Creat New EC@2 Instance
        New-EC2Instance -ImageId $Script:AWSImageId -InstanceType $Script:AWSInstanceType -KeyName $Script:HashValue['KeyPair'] -Region $Script:HashValue['Region']`
        -ProfileName $Script:ProfileNameVaule -UserData $Script:UserDataText -EncodeUserData -Force
    }
}



# Remove Profile
Remove-AWSCredentialProfile -ProfileName $Script:ProfileNameVaule -Force

<<<<<<< HEAD
#EndRegion to deploy Ubuntu Host For ASP.NET CORE with NGINX
# ===========================================================================
=======
#EndRegion to Deploy Ubuntu and install NGINX and DotNet Core
# ===========================================================================
>>>>>>> 2bb0b6867cbfaa57f5d83f468bb773d3dd44dfed
