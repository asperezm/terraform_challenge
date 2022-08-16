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
![dns_name](https://user-images.githubusercontent.com/47333056/184996040-341a5ab2-a99f-4d7f-ac7a-86dedcda7ea9.png)
Run `terraform destroy` when you don't need these resources.

## Operation
```bash
http://nlb-5f18399106418f1e.elb.us-east-1.amazonaws.com/
```
### First instance
![first](https://user-images.githubusercontent.com/47333056/184996128-36b622f3-420d-40e2-a82e-7122510f716c.png)
### Second instance
![second](https://user-images.githubusercontent.com/47333056/184996156-b18efecc-807e-41d3-a25b-2740ead72d12.png)