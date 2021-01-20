## Example 8
* In this example, we'll provision an EC2 instance.
* Then we'll output few of its attributes.
* The output name/identifier and attribiute name can be same.

## Steps
Created `terraform.tfvars, var.tf, provider.tf, resource.tf`.

## Commands
```
terraform init
terraform validate
terraform plan
terraform apply
terraform destroy
alias svg='terraform graph > example.dot && dot example.dot -Tsvg -o example.svg'
svg
```

## Output
We get below output, after `terraform apply`,

```
Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

amazon_resource_name = arn:aws:ec2:ap-southeast-1:117615773624:instance/i-0f2c38122f3d91320
availability_zone = ap-southeast-1b
instance_id = i-0f2c38122f3d91320
private_dns = ip-172-31-21-152.ap-southeast-1.compute.internal
private_ip = 172.31.21.152
public_dns = ec2-52-221-232-79.ap-southeast-1.compute.amazonaws.com
public_ip = 52.221.232.79
```

## Terraform graph

![](./example.svg)
