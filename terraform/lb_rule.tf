resource "aws_lb_listener_rule" "path_based_routing" {
  listener_arn = aws_lb_listener.main.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.page1.arn
  }

  condition {
    path_pattern {
      values = ["/page1*"]
    }
  }
}

resource "aws_lb_listener_rule" "path_based_routing_2" {
  listener_arn = aws_lb_listener.main.arn
  priority     = 101

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.page2.arn
  }

  condition {
    path_pattern {
      values = ["/page2*"]
    }
  }
}

resource "aws_lb_target_group" "page1" {
  name_prefix        = "page1"
  port               = 80
  protocol           = "HTTP"
  target_type        = "instance"
  vpc_id             = aws_vpc.main.id
}

resource "aws_lb_target_group" "page2" {
  name_prefix        = "page2"
  port               = 80
  protocol           = "HTTP"
  target_type        = "instance"
  vpc_id             = aws_vpc.main.id
}
