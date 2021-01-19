# Outputs.tf
output "instance_id" {
  description = " Instance ID of the instance"
  value       = "${aws_instance.demo.id}"
}

output "instance_IP" {
  description = " Public IP of the instance"
  value       = "${aws_instance.demo.public_ip}"
}

output "bucket_arn" {
  description = " Bucket ARN "
  value       = "${aws_s3_bucket.remote_state_bucket.arn}"
}
