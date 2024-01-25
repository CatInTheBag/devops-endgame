output "vpc_id" {
  value = aws_vpc.myapp-vpc.id
}

output "ec2_id" {
  value = module.myapp-server.myapp-ec2-instance.id
}

output "ec2_public_ip" {
  value = module.myapp-server.myapp-ec2-instance.public_ip
}