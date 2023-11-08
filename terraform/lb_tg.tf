#####
resource "aws_lb" "example" {
  name               = "example-elb"
  internal           = false
  load_balancer_type = "application"
  
  security_groups = [aws_security_group.elb.id]
  
  listener {
    protocol = "HTTP"
    port     = 80

    default_action {
      type             = "forward"
      target_group_arn = aws_lb_target_group.example.arn
    }
  }
}

resource "aws_lb_target_group" "example" {
  name_prefix       = "example-"
  port              = 80
  protocol          = "HTTP"
  vpc_id            = var.vpc_id
  
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 5
    timeout             = 10
    interval            = 30
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
  }

  # Define backend instances using an Auto Scaling Group
  target_type = "instance"
  vpc_id      = var.vpc_id
  backend_server_port = 80
  
  # The ARN of the target group will be used in the ELB listener configuration
  lifecycle {
    create_before_destroy = true
  }
}
