# Provider Variables: 

variable "aws_region" {
  description = "The AWS region where resources will be created."
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "The AWS profile to use for authentication."
  type        = string
  default     = "Admin-User"
}

variable "vpc_id" {
  description = "The VPC ID"
  type        = string
  default     = "default_vpc_id"
}

variable "ami_id" {
  description = "The AMI ID"
  type        = string
  default     = "ami-053b0d53c279acc90"
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The SSH key name"
  type        = string
  default     = "komiser_ssh_key"
}

variable "public_key_path" {
  description = "Path to the public SSH key"
  type        = string
  default     = "/path/to/public_ssh_key"
}

variable "tag_name" {
  description = "The tag name to use for resources"
  type        = string
  default     = "komiser-django-app"
}
