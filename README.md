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
![loadbalancer](https://user-images.githubusercontent.com/47333056/185229497-81462216-7326-476c-9abd-6518b6d872db.png)
Run `terraform destroy` when you don't need these resources.

## Operation
```bash
http://nlb-5e7a95ea4fdbd752.elb.us-east-1.amazonaws.com/
```
### First instance
![server1](https://user-images.githubusercontent.com/47333056/185229571-c0778f8e-5f64-438c-856f-264006e33d12.png)
### Second instance
![server2](https://user-images.githubusercontent.com/47333056/185229616-0ddf340f-1273-42aa-8b1a-a1175621733a.png)

## Script check
The following script we can check the operation of the load balancer and that the load is distributed in 2 instances
```bash
#!/bin/bash
while [ true ]
do
curl -H 'Cache-Control: no-cache' <NLB_URL>
done
```
![script](https://user-images.githubusercontent.com/47333056/185230194-7a3ab4a9-fa1f-407a-8db1-2ef138b92fdf.png)
