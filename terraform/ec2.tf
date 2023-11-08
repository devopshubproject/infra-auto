resource "aws_launch_template" "example" {
  name_prefix   = "example-"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  
  # Specify user data script to configure the instance as a backend
  user_data = filebase64("${path.module}/user-data.sh")
}

resource "aws_autoscaling_group" "example" {
  name_prefix                 = "example-asg-"
  max_size                    = 2
  min_size                    = 1
  desired_capacity            = 1
  launch_template             = {
    id      = aws_launch_template.example.id
    version = "$Latest"
  }
  
  # Associate the ELB target group with the Auto Scaling Group
  target_group_arns           = [aws_lb_target_group.example.arn]
  
  # Use these tags to group instances by role and version
  tag {
    key                 = "Role"
    value               = "backend"
    propagate_at_launch = true
  }
  tag {
    key                 = "Version"
    value               = "1.0.0"
    propagate_at_launch = true
  }
}
