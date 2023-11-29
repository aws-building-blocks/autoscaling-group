output "id" {
  value = aws_autoscaling_group.asg.id
}

output "arn" {
  value = aws_autoscaling_group.asg.arn
}

output "name" {
  value = aws_autoscaling_group.asg.name
}

output "instance_public_ips" {
  value = data.aws_instances.instances.public_ips
}
