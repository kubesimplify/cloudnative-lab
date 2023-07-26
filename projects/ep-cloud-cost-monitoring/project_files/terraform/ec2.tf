# EC2 instance resource:
resource "aws_instance" "komiser_instance" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ssh_key.key_name

  vpc_security_group_ids = [aws_security_group.allow_tls_1.id]

  depends_on = [aws_security_group.allow_tls_1]

  user_data  = "${file("install.sh")}"

  tags = {
    Name = "aws-komiser"
  }
}

resource "aws_key_pair" "ssh_key" {
  key_name   = "koimser_ssh_key"
  public_key = file("~/.ssh/komiser-aws.pub") # ssh public key location

  tags = {
    Name = "aws-komiser"
  }
}

# Elastic IP:
resource "aws_eip" "koimser_instance_ip" {
  instance = "${aws_instance.komiser_instance.id}"
  # vpc      = true 
  depends_on = [aws_instance.komiser_instance]
}
resource "aws_eip_association" "eip_association" {
  instance_id   = "${aws_instance.komiser_instance.id}"
  allocation_id = "${aws_eip.koimser_instance_ip.id}"
}

resource "aws_security_group" "allow_tls_1" {
  name        = "allow_tls_1"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-0bdd3ce0f25d86750" # default

  ingress {
        description = "For ssh"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
        description = "For Django app"
        from_port   = 8000
        to_port     = 8000
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "aws-komiser"
  }
}

output "ec2_ip" {
  value = aws_eip.koimser_instance_ip.public_ip
}