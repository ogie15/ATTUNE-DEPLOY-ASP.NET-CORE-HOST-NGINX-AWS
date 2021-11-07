# This step deploys an AWS EC2 Instance of an Ubuntu 18.04 image and installs NGINX and ASP.NET Core

The Blueprint first gets the Execution Policy of the current PowerShell session.

Then, checks if the Execution Policy is set to Unrestricted.

If it's not, it then sets the Execution Policy to Unrestricted for the current PowerShell session.

Next, the AWSPowerShell module is imported to the current session.

Then the values below are set:

1. AccessKeyValue: This is the AWS IAM User access key corresponding to the `AccessKey` set in the Inputs Tab.
1. SecretKeyValue: This is the AWS IAM User secret key corresponding to the `SecretKey` set in the Inputs Tab.
1. HashValue: This holds a hashtable containing the Region of the virtual machine and KeyPair in AWS corresponding to the `HashValue` set in the Inputs Tab.
1. AWSImageId: This holds the AWS Image Id `(Default = ami-0244a5621d426859b)` corresponding to the `AWSImageId` set in the Inputs Tab.
1. AWSInstanceType: This holds the AWS Instance Type `(Default = t2.micro)` corresponding to the `AWSInstanceType` set in the Inputs Tab.

A variable `UserDataText` holding a Bash installation script is declared.

Below is Bash installation script:

```bash
#!/bin/bash
wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update; \
sudo apt-get install -y apt-transport-https && \
sudo apt-get install -y dotnet-sdk-5.0
sudo apt-get install -y dotnet-sdk-3.1
sudo apt-get install -y apt-transport-https && \
sudo apt-get install -y aspnetcore-runtime-5.0
sudo apt-get install -y aspnetcore-runtime-3.1
sudo apt-get install -y nginx

```

Next, the AWS IAM User Credential is set and saved in the local credential store.

Then an AWS EC2 Instance with an Ubuntu Image is deployed with ASP.NET Core and NGINX installed.

Finally, the credential profile created in the session is removed from the local credential store.
