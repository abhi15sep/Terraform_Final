## Introduction
This directory contains examples to practice terraform syntax. Terraform files are written in Hashicorp Configuration Language (HCL). To understand the syntax of this language, we're practising these examples.

## Variables in Terraform
Variables in terraform are of different types. When we declare variables in terraform, we can mention type of variable as an attribute. Even if we don't mention its type, terraform will decide its type. But it is a good practice to mention variable types.

Syntax: <br>

```
variable "name" {
  type = string
  default = "Inderpal Singh"
}
```

We declare a variable by using the `variable` keyword. The name of the variable is declared in double quotes. Then we mention the type of variable and its default value.

**To test it without using `terraform apply`, we can use terraform console** <br>
```
> terraform console
> var.name
> "${var.name}"
> exit
```

## Types of variables
* `string` variables
* `number` variables
* `bool` variables
* `list` variables
* `set` variables
* `map` variables
* `object` variables
* `tuple` variables

Amongst above variables, `string, number, bool` are termed as simple type variables. And `list, set, map, object, tuple` are termed as complex type variables.

Complex variables are so called, because they are declared as `list(type)` wherein type can be one of the simple variable types. It is our wish to mention `list(string/number/bool)`. Even if we don't mention type, terraform will calculate it on its own. But it is a good practice to mention type.

## "string" variables
```
variable "school" {
  type    = string
  default = "St. Xavier's high School"
}
```

## `number` variables
```
variable "age" {
  type    = number
  default = 26
}
```

## `bool` variable
```
variable "status" {
  type    = bool
  default = true
}
```

## List variables
* List variables can contain dupicate values.
* List variables are always ordered. For example, the below list will always return [1,2,3] and never [3,2,1] or [2,1,3] or unordered values.

```
variable "integer_list" {
  type = list
  default = [1,2,3]
}
```

```
> terraform console
> var.integer_list
> var.integer_list[0]
```

We can use functions also on list variables,
```
element(var.integer_list, 0)  -> will yield the first element of the list at index 0
element(var.integer_list, 1)
slice(var.integer_list, 0, 2) -> will yield values stored at 0 index and next 2 values in List
```

## Set variables
* A set is like a list.
* A set will always have unique values. Even if we store duplicate values, itll return unique values only.
* In a set, the order is not fixed.
* So, a list [5,1,1,2] becomes [1,2,5] as a set. (Terraform will return set values in sorted form)

## Map variables
* Map consists of `key`and `value` pairs.

```
variable "capitals" {
  type = map
  default = {
    Punjab = "Chandigarh"
    Maharashtra = "Mumbai"
    Haryana = "Chandigarh"
  }
}
```

```
> terraform console
> var.capitals
> var.capitals["Punjab"]
> "${var.capitals["Punjab"]}"
```

## Object variables
* An object is ike a map.
* But object can contain `key-value` pairs (i.e. each element) of different types.

For example,
```
{
  Name      = "John"
  House.No  = 10
}
```

## Tuple variables
* A tuple is like a list.
* But each element can be of different type.

For example,
```
[0, "string", true]
```

## How to declare resources?
When we declare a resource, we need to specify the provider first. Provider is the cloud platform to which our resource belongs. We can define provider, resources, variables, etc in same file. But for simple understanding, we'll have separate files like resources.tf, variables.tf, etc.

We declare resources with `resource` keyword, followed by `resource type`, followed by `resource name` and then the attributes. `resource type` is nothing but `aws_instance, aws_eip, aws_elb, etc`.

We cannot have same name for 2 resources of same resource type! So, every resource in terraform is unique in terms of type and name combination.

## `file upload` and `remote exec`
This can be used to provision software to EC2 instances. We can upload a config file or a script to EC2 instance and run it using `remote exec` (in case of a script). `file upload` is defined using a `provisioner`. This is shown below,

```
resource "aws_instance" "ubuntu-vm" {
  ami           = "ami-xxxxxx"
  instance_type = "t2.micro"

  provisioner "file" {
    source        = "app.conf"
    destination   = "/etc/myapp.conf"
  }
}
```

A provisioner may use ssh on Linux hosts or WinRM on Windows hosts to copy file to EC2 instance remotely. So, we need to specify the ssh connection also (as below),

```
resource "aws_instance" "ubuntu-vm" {
  ami           = "ami-xxxxxxxx"
  instance_type = "t2.micro"
  provisioner "file" {
    source      = "app.conf"
    destination = "/etc/myapp.conf"
    connection {
      user      = var.instance_username
      password  = var.instance_password
    }
  }
}
```

The type of the connection by default is ssh. But if we want to use another type of connection like WinRM, we need to specify it using `type` attribute. However, in terms of AWS, we are mostly going to use ssh keypairs to connect. Below is an example.

```
resource "aws_key_pair" "deployer" {
  key_name    = "deployer-key"
  public_key  = var.ssh_public_key    # the variable ssh_public_key is defined in terraform.tfvars file wherein it holds value of our public key like "ssh-rsa Ivdgdg...."
}

resource "aws_instance" "ubuntu-vm" {
  ami             = "ami-xxxx"
  instance_type   = "t2.micro"
  provisioner "file" {
    source        = "app.conf"
    destination   = "/etc/myapp.conf"
    connection {
      type        = "ssh"
      user        = var.instance_username
      private_key = file(var.path_to_private_key)
      host        = aws_instance.ubuntu-vm.public_ip    #host represents the address of the host to connect to
    }
  }
}
```

To remotely execute our copied script on the EC2 instance, we use `remote-exec` provisioner.

```
resorce "aws_key_pair" "deployer" {
  key_name        = "deployer"
  public_key      = var.PUBIC_SSH_KEY
}

resource "aws_instance" "ubuntu-vm" {
  ami             = "ami-xxxx"
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.deployer.id
  tags            = {
    Name          = "ubuntu-vm"
  }
  provisioner "file" {
    source        = "./install_docker.sh"
    destination   = "/home/ubuntu/install_docker.sh"
  }
  provisioner "remote-exec" {
    inline        = [
      "chmod +x /home/ubuntu/install_docker.sh",
      "/home/ubuntu/install_docker.sh",
    ]
  }
  connection {
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = var.PATH_TO_PRIVATE_KEY
    host        = aws_instance.ubuntu-vm.public_ip
  }
}
```

The connection is common for both provisioners. Previously, it was mentioned only for `file` provisioner. So, the script got copied but the `remote-exec` provisioner couldn't execute the script as it couldn't connect to the host. So, connection has to be defined either separately for each provisioner or at one place which is common for all provisioners (as in example above).

## Outputting attributes
* Outputting attributes can help to output valuable information or feed it to external software.
* For example,
```
resource "aws_instance" "ubuntu-vm" {
  ami           = "ami-xxxx"
  instance_type = "t2.micro"
  tags          = {
    Name        = "ubuntu-vm"
  }
}

output "ip" {
  value         = aws_instance.ubuntu-vm.public_ip
}
```
* We can output any attribute. But we need to specify below 3 parameters,
  * resource type     : aws_instance
  * resource name     : ubuntu-vm
  * attribute name    : public_ip
* The list of attributes for a partiular resource can be found from terraform website.
* The `local-exec` provisioner can also be used to output attributes and store them in a file.
