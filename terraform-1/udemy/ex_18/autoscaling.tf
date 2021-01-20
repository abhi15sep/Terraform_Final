# Defining autoscaling launch configuration

resource "aws_launch_configuration" "demo-launch-configuration" {
  name                        = "demo-launch-configuration"
  image_id                    = "ami-061eb2b23f9f8839c"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.deployer-key.id
}

# Defining autoscaling group

resource "aws_autoscaling_group" "demo-autoscaling-group" {
  name                        = "demo-autoscaling-group"
  availability_zones          = ["ap-southeast-1a", "ap-southeast-1b"]
  launch_configuration        = aws_launch_configuration.demo-launch-configuration.name
  min_size                    = "1"
  max_size                    = "2"
  health_check_grace_period   = "300"
  health_check_type           = "EC2"
  force_delete                = true
  tag {
    key                       = "Name"
    value                     = "ec2 instance"
    propagate_at_launch       = true
  }
}

# Defining autoscaling policy for dynamic scale up

resource "aws_autoscaling_policy" "demo-cpu-policy-scale-up" {
  name                        = "demo-cpu-policy-scale-up"
  autoscaling_group_name      = aws_autoscaling_group.demo-autoscaling-group.name
  adjustment_type             = "ChangeInCapacity"
  scaling_adjustment          = "1"
  cooldown                    = "300"
  policy_type                 = "SimpleScaling"
}

# Defining autoscaling policy for dynamic scale down

resource "aws_autoscaling_policy" "demo-cpu-policy-scale-down" {
  name                        = "demo-cpu-policy-scale-down"
  autoscaling_group_name      = aws_autoscaling_group.demo-autoscaling-group.name
  adjustment_type             = "ChangeInCapacity"
  scaling_adjustment          = "-1"
  cooldown                    = "300"
  policy_type                 = "SimpleScaling"
}

# Defining CloudWatch alarm to trigger our autoscaling policy scale up

resource "aws_cloudwatch_metric_alarm" "demo-cpu-up-alarm" {
  alarm_name                  = "demo-cpu-up-alarm"
  comparison_operator         = "GreaterThanOrEqualToThreshold"
  threshold                   = "30"
  evaluation_periods          = "2"
  metric_name                 = "CPUUtilization"
  namespace                   = "AWS/EC2"
  period                      = "120"
  statistic                   = "Average"
  dimensions                  = {
    "AutoScalingGroupName"    = aws_autoscaling_group.demo-autoscaling-group.name
  }
  actions_enabled             = true
  alarm_actions               = ["${aws_autoscaling_policy.demo-cpu-policy-scale-up.arn}"]
}

# Defining CloudWatch alarm to trigger our autoscaling policy scale down

resource "aws_cloudwatch_metric_alarm" "demo-cpu-down-alarm" {
  alarm_name                  = "demo-cpu-down-alarm"
  comparison_operator         = "LessThanOrEqualToThreshold"
  threshold                   = "5"
  evaluation_periods          = "2"
  metric_name                 = "CPUUtilization"
  namespace                   = "AWS/EC2"
  period                      = "120"
  statistic                   = "Average"
  dimensions                  = {
    "AutoScalingGroupName"    = aws_autoscaling_group.demo-autoscaling-group.name
  }
  actions_enabled             = true
  alarm_actions               = ["${aws_autoscaling_policy.demo-cpu-policy-scale-down.arn}"]
}

# Attaching SNS topic to out autoscaling group to get notifications regarding autoscaling events

resource "aws_autoscaling_notification" "autoscaling-sns-notification" {
  group_names                 = ["${aws_autoscaling_group.demo-autoscaling-group.name}"]
  topic_arn                   = aws_sns_topic.autoscale-cpu-alarm-sns.arn
  notifications               = ["autoscaling:EC2_INSTANCE_LAUNCH", "autoscaling:EC2_INSTANCE_TERMINATE", "autoscaling:EC2_INSTANCE_LAUNCH_ERROR"]
}
