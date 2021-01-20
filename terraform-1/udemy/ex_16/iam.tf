# Defining our IAM resources

# Defining group

resource "aws_iam_group" "administrators" {
  name          = "administrators"
}

# Defining policy attachment

resource "aws_iam_policy_attachment" "administrators-policy-attachment" {
  name          = "administrators-policy-attachment"
  groups        = ["${aws_iam_group.administrators.name}"]
  policy_arn    = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# Defining users

resource "aws_iam_user" "admin-1" {
  name          = "admin-1"
  tags          = {
    Name        = "admin-1"
  }
}

resource "aws_iam_user" "admin-2" {
  name          = "admin-2"
  tags          = {
    Name        = "admin-2"
  }
}

# Defining group membership for above IAM users

resource "aws_iam_group_membership" "admin-group-membership" {
  name          = "admin-group-membership"
  users         = ["${aws_iam_user.admin-1.name}", "${aws_iam_user.admin-2.name}"]
  group         = aws_iam_group.administrators.name
}
