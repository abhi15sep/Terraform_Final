# Defining our IAM role

resource "aws_iam_role" "s3-inder-bucket-1993-role" {
  name                  = "s3-inder-bucket-1993-role"
  assume_role_policy    = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags                  = {
    Name                = "s3-inder-bucket-1993-role"
  }
}

# Defining aws_iam_instance_profile which will be used while provisioning the EC2 instance

resource "aws_iam_instance_profile" "s3-inder-bucket-1993-role-instance-profile" {
  name                  = "s3-inder-bucket-1993-role"          # same as aws iam role name for techical reasons
  role                  = aws_iam_role.s3-inder-bucket-1993-role.name
}
