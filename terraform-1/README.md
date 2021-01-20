## Terraform

This repository contains practice examples from books on Terraform written by James Turnbull, Yevgeniy Brikman. Also this repository contains practice examples from Udemy course on Terraform.

## How to install Terraform in Ubuntu 18.04 LTS x86_64 machine

Terraform is available as a binary. It can be downloaded and installed by following below steps:

1. `wget https://releases.hashicorp.com/terraform/0.12.9/terraform_0.12.9_linux_amd64.zip` <br>
Before execting above command, please check which is the atest terraform version available. We can also download other versions from the above site.
2. `unzip terraform_0.12.9_linux_amd64.zip`
3. `sudo chown root:root terraform`
4. `mv terraform /usr/local/bin/`
4. `terraform --version` OR `terraform version`

## Configuration of AWS secret credentials.

To enable terraform to communicate to AWS cloud platform, we configure AWS secret credentials. [Here is the link](https://aws.amazon.com/cli/)

## .gitignore file

* We have excluded .terraform directory which gets generated after `terraform init` command. This directory contains all backend plugins used by terraform to communicate to specified provider (AWS/Azure/etc). If we change any `provider` configuration, then we need to execute `terraform init` again to update `.terraform` files to connect successfully.
* We have excluded `*.dot` file which may contain confidential information. This file is generated to view graphical images of our infra.
* We have excluded `*.plan` file which may contain confidential information. This file is generated using `terraform plan` command to output plans before implementing changes using `terraform apply`.
* We have excluded `terraform.tfstate` and `terraform.tfstate.backup` files to exclude state files.
* We have excluded `*.pub` files to exclude ssh public keys.
* We have excluded `terraform.tfvars` file to exclude secret variables.

## Viewing terraform graphs.

* To generate dot file. <br>
`terraform graph > exapmle.dot`
* To convert dot file to svg image. we need to get installed `graphviz` te get the `dot` binary. [Here is the guide](https://github.com/inderpal2406/documents/blob/master/graphviz_installation.md). <br>
`dot example.dot -Tsvg -o example.svg`
* To view svg image in Eye of Gnome image viewer in Ubuntu. <br>
`eog example.svg`

## AWS EC2 instance AMI reference for an Ubuntu VM
To know AMI details for the AWS EC2 instance in a particular region, we can refer this [website](https://cloud-images.ubuntu.com/locator/ec2/).
