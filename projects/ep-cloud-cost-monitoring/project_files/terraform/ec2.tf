# EC2 instance resource:
resource "aws_instance" "komiser_instance" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ssh_key.key_name

  vpc_security_group_ids = [
    aws_security_group.allow_tls.id
  ]

  depends_on = [aws_security_group.allow_tls]
  tags = {
    Name = "aws-komiser"
  }
}

resource "aws_key_pair" "ssh_key" {
  key_name   = "koimser_ssh_key"
  public_key = file("~/.ssh/komiser-aws.pub") # public key location

  tags = {
    Name = "aws-komiser"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-0bdd3ce0f25d86750" # default

  ingress {
        description = "For ssh"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "aws-komiser"
  }
}

output "ec2_ip" {
  value = aws_instance.komiser_instance.public_ip
}