resource "aws_lb_target_group" "backend1" {
  name        = "backend1"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id

  health_check {
    path = "/healthcheck"
  }
}

resource "aws_lb_target_group" "backend2" {
  name        = "backend2"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id

  health_check {
    path = "/healthcheck"
  }
}

##############
resource "aws_lb_target_group" "backend1" {
  name_prefix     = "backend1-"
  port            = 80
  protocol        = "HTTP"
  vpc_id          = aws_vpc.main.id
  
  health_check {
    protocol     = "HTTP"
    path         = "/"
    interval     = 30
    timeout      = 10
    healthy_threshold = 3
    unhealthy_threshold = 3
  }
}

resource "aws_lb_target_group" "backend2" {
  name_prefix     = "backend2-"
  port            = 80
  protocol        = "HTTP"
  vpc_id          = aws_vpc.main.id
  
  health_check {
    protocol     = "HTTP"
    path         = "/"
    interval     = 30
    timeout      = 10
    healthy_threshold = 3
    unhealthy_threshold = 3
  }
}
