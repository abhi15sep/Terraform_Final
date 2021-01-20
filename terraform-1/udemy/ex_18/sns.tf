# Defining our SNS topic

resource "aws_sns_topic" "autoscale-cpu-alarm-sns" {
  name         = "autoscale-cpu-alarm-sns"
  display_name = "autoscale-cpu-alarm-sns"
}


# We have to manually subscribe to this SNS topic through AWS console as email subscription is currently unsupported in terraform.
