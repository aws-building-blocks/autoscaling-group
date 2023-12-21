# Autoscaling Group
resource "aws_autoscaling_group" "asg" {
  name                = var.asg_name
  vpc_zone_identifier = var.vpc_zone_identifier
  desired_capacity    = var.desired_capacity
  max_size            = var.max_size
  min_size            = var.min_size
  health_check_type   = var.health_check_type
  target_group_arns   = var.target_group_arns

  launch_template {
    id      = var.launch_template_id
    version = var.launch_template_version
  }

  tag {
    key                 = var.asg_tag_key
    value               = var.launch_template_version
    propagate_at_launch = true
  }

  instance_refresh {
    strategy = var.instance_refresh.strategy
    triggers = var.instance_refresh.triggers
  }
}

data "aws_instances" "instances" {
  instance_tags = {
    "aws:autoscaling:groupName" = aws_autoscaling_group.asg.name
  }
}
