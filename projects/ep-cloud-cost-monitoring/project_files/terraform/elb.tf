# ELB security group:
resource "aws_security_group" "komiser_elb_sg" {
  name        = "komiser_elb"
  description = "Komiser ELB Security Group"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.tag_name
  }
}

# Create a new Elastic load balancer:
resource "aws_elb" "komiser_elb" {
  name               = "komiser-elb"
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d"]
  security_groups = [aws_security_group.komiser_elb_sg.id]
  instances = [aws_instance.komiser_instance.id]

  access_logs {
    bucket        = "komiser-elb-logs"
    interval      = 5
  }

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:8000"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = var.tag_name
  }
}

# Output the ELB Domain:
output "komiser_elb_dns" {
  value = aws_elb.komiser_elb.dns_name
  depends_on = [aws_elb.komiser_elb]
}
