# Test - AWS Apprenticeship - SoftServe

The task consists of two separate scenarios. In the First scenario you should create infrastructure described below (Pic.1) in the AWS public cloud. You should use terraform with version at least 0.12.31. Also, you should describe required resources which necessary for creating this architecture such as VPC, Subnet and etc. in AWS. Environment settings:

· OS: Windows Server 2019 or Linux

· Traffic should be routed between two instances.

· In AWS(use Network LoadBalancer)

The Second scenario you should create Bash (PowerShell) scripts that can deploy web server (IIS, NGINX, Apache and etc.) with hello world website to VMs created in the previous scenario. Each script run should clean up and redeploy all artifacts and components.

## Usage

To run the project you need to create an additional file named `terraform.tfvars` with the AWS variables

And you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```
Run `terraform destroy` when you don't need these resources.