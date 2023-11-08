resource "aws_launch_configuration" "backend1" {
  name_prefix   = "backend1"
  image_id      = var.ami_id
  instance_type = var.instance_type
  user_data     = base64encode(templatefile("${path.module}/userdata.sh", { backend_group = "backend1" }))
  security_groups = [
    aws_security_group.lb.id,
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_launch_configuration" "backend2" {
  name_prefix   = "backend2"
  image_id      = var.ami_id
  instance_type = var.instance_type
  user_data     = base64encode(templatefile("${path.module}/userdata.sh", { backend_group = "backend2" }))
  security_groups = [
    aws_security_group.lb.id,
  ]

  lifecycle {
    create_before_destroy = true
  }
}


