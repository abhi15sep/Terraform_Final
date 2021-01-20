## Example 1

A simple example containing a single AWS EC2 instance is practised here. It is not necessary to by-heart each attribute related to `aws_instance`. We can search on google with `terraform aws_instance` to get details of each attribute.

For example we got this link via google: https://www.terraform.io/docs/providers/aws/r/instance.html

We defined `terraform.tfvars` which includes API keys to contact AWS. We mentioned this file in `.gitignore` file.

The graph of AWS resources is as follows,

![](./example.svg)
