output "public_ip" {
  description = "The public ip of the server"
  value       = aws_instance.jenkins_host.public_ip
}

output "public_dns" {
  description = "The public dns of the server"
  value       = aws_instance.jenkins_host.public_dns
}