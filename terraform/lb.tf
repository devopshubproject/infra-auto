resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.backend1.arn
  }

  # Route traffic to backend group 1 if the requested path starts with "/page1.html"
  dynamic "rule1" {
    for_each = {
      priority   = 10
      path_pattern = "/page1.html*"
    }

    content {
      priority = rule1.value.priority
      action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.backend1.arn
      }
      condition {
        field  = "path-pattern"
        values = [rule1.value.path_pattern]
      }
    }
  }

  # Route traffic to backend group 2 if the requested path starts with "/page2.html"
  dynamic "rule2" {
    for_each = {
      priority   = 20
      path_pattern = "/page2.html*"
    }

    content {
      priority = rule2.value.priority
      action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.backend2.arn
      }
      condition {
        field  = "path-pattern"
        values = [rule2.value.path_pattern]
      }
    }
  }
}
