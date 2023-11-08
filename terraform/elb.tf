resource "aws_elb" "example_elb" {
  name               = "example-elb"
  subnets            = ["${aws_subnet.public.*.id}"]
  security_groups    = ["${aws_security_group.elb_sg.id}"]
  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = 80
    instance_protocol = "http"
  }
  health_check {
    target            = "HTTP:80/"
    interval          = 30
    timeout           = 5
    unhealthy_threshold = 2
    healthy_threshold = 2
  }
}

