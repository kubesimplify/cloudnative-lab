# EC2 instance resource:
resource "aws_instance" "komiser_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.ssh_key.key_name

  vpc_security_group_ids = [aws_security_group.allow_tls_1.id]

  depends_on = [aws_security_group.allow_tls_1]

  user_data  = "${file("install.sh")}"

  tags = {
    Name = var.tag_name
  }
}

# SSH key pair
resource "aws_key_pair" "ssh_key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)

  tags = {
    Name = var.tag_name
  }
}

# Elastic IP resource
resource "aws_eip" "koimser_instance_ip" {
  instance = aws_instance.komiser_instance.id
  depends_on = [aws_instance.komiser_instance]

  tags = {
    Name = var.tag_name
  }
}
# Elastic IP association:
resource "aws_eip_association" "eip_association" {
  instance_id   = "${aws_instance.komiser_instance.id}"
  allocation_id = "${aws_eip.koimser_instance_ip.id}"
}

# Security group resource:
resource "aws_security_group" "allow_tls_1" {
  name        = "allow_tls_1"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

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
    Name = var.tag_name
  }
}

# Output the instance IP:
output "ec2_ip" {
  value = aws_eip.koimser_instance_ip.public_ip
}