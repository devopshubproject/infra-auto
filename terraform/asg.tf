resource "aws_autoscaling_group" "backend1" {
  name                 = "backend1"
  vpc_zone_identifier  = aws_subnet.private.*.id
  launch_configuration = aws_launch_configuration.backend1.name
  target_group_arns     = [aws_lb_target_group.backend1.arn]
  min_size              = 1
  max_size              = 3
  health_check_grace_period = 300
}

resource "aws_autoscaling_group" "backend2" {
  name                 = "backend2"
  vpc_zone_identifier  = aws_subnet.private.*.id
  launch_configuration = aws_launch_configuration.backend2.name
  target_group_arns     = [aws_lb_target_group.backend2.arn]
  min_size              = 1
  max_size              = 3
  health_check_grace_period = 300
}