# Test - AWS Apprenticeship - SoftServe

The task consists of two separate scenarios. In the First scenario you should create infrastructure described below (Pic.1) in the AWS public cloud. You should use terraform with version at least 0.12.31. Also, you should describe required resources which necessary for creating this architecture such as VPC, Subnet and etc. in AWS. Environment settings:

· OS: Windows Server 2019 or Linux

· Traffic should be routed between two instances.

· In AWS(use Network LoadBalancer)

![picture1](https://user-images.githubusercontent.com/47333056/183780631-cdb4e9b5-f739-4dba-9dbd-a348caf13008.png)

The Second scenario you should create Bash (PowerShell) scripts that can deploy web server (IIS, NGINX, Apache and etc.) with hello world website to VMs created in the previous scenario. Each script run should clean up and redeploy all artifacts and components.

## Usage

To run the project you need to create an additional file named `terraform.tfvars` with the AWS variables

And you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```
And these are the results of the commands, where we can see the url of the load balancer
![Screenshot_3](https://user-images.githubusercontent.com/47333056/183782145-f9cc8fa7-43e4-4a44-9ee3-73903e55dd95.png)
Run `terraform destroy` when you don't need these resources.

## Operation
```bash
alb-597928146.us-east-1.elb.amazonaws.com
```
### First instance
![screen1](https://user-images.githubusercontent.com/47333056/183780744-3465b0d7-d0cc-4659-8535-8a046f0ad148.png)
### Second instance
![screen2](https://user-images.githubusercontent.com/47333056/183780769-f929cc6e-da0e-421a-9989-69136194e1d1.png)