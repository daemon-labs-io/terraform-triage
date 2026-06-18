output "instance_id" {
  description = "EC2 instance ID, useful for `aws ssm start-session`."
  value       = aws_instance.web.id
}

output "public_ip" {
  description = "Public IPv4 address of the EC2 instance."
  value       = aws_instance.web.public_ip
}

output "public_dns" {
  description = "Public DNS name of the EC2 instance."
  value       = aws_instance.web.public_dns
}

output "web_url" {
  description = "URL serving the baseline nginx response."
  value       = "http://${aws_instance.web.public_dns}"
}
