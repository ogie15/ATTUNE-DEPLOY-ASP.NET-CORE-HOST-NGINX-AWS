# Using Attune to deploy an Ubuntu AWS EC2 instance with NGINX and ASP.NET Core

This Blueprint is used for deploying an Ubuntu AWS EC2 instance with NGINX and ASP.NET Core installed.

## Pre-Blueprint Attune setup

1. On the Inputs tab, create a Windows Node for the host you wish to run the AWS EC2 shutdown script.
1. On the Inputs tab, create a Windows Credentials to connect to the host you wish to run the AWS EC2 shutdown script.
1. On the Inputs tab, create a Text value to store the values below:
    - AccessKey: This is the AWS IAM User access key (DataType: String).
    - SecretKey: This is the AWS IAM User secret key (DataType: String).
    - HashValue: This holds a hash table containing the Region of the virtual machine and KeyPair (DataType: Hashtable).
    - AWSImageId: This holds the AWS Image Id (DataType: String).
    - AWSInstanceType: This holds the AWS Instance Type (DataType: String).

---

*HashValue Syntax:*

```powershell
@{"Region" = "eu-west-2";"KeyPair" = "pemkeyname"}
```

**NOTE**: *Ensure to edit the value of the parameters `AccessKey` and `SecretKey` in Attune to match the AWS IAM User Credential with the privilege to perform this operation.*

**NOTE**: *The `Region` should be edited as well to match the desired region for the EC2 Instance.*

**NOTE**: *The `KeyPair` should be edited as well to match the AWS Key Pair*

**NOTE**: *The `AWSImageId` should be edited as well to match the desired AWS Image ID `(Default = ami-0244a5621d426859b)`*

**NOTE**: *The `AWSInstanceType` should be edited as well to match the desired AWS Instance Type `(Default = t2.micro)`*

---

## Blueprint Steps

1. Check and Install the AWS PowerShell Module
1. Deploy an Ubuntu AWS EC2 instance with NGINX and ASP.NET Core installed
