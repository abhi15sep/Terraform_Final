# Defining policy to be attahed to our IAM role

resource "aws_iam_role_policy" "s3-inder-bucket-1993-role-policy" {
  name            = "s3-inder-bucket-1993-role-policy"
  role            = aws_iam_role.s3-inder-bucket-1993-role.id  # will name do in place of id?
  policy          = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::inder-bucket-1993",
        "arn:aws:s3:::inder-bucket-1993/*"
      ]
    }
  ]
}
EOF
}
