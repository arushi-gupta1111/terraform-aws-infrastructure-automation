
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "ec2_instance_id" {
  value = module.ec2.instance_id
}

output "web_url" {
  value = "http://${module.ec2.public_ip}"
}
