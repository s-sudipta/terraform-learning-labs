# Get default VPC
data "aws_vpc" "default" {
  default = true
}

# Create a security group
resource "aws_security_group" "security_group" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = data.aws_vpc.default.id

  # Ingress rule to allow SSH access
  dynamic "ingress" {
    for_each = var.enable_ssh ? [1] : []
    content {
      description = "Allow SSH"
      from_port   = var.port.ssh
      to_port     = var.port.ssh
      protocol    = var.protocol
      cidr_blocks = var.allowed_ssh_cidr
    }
  }

  # Ingress rule to allow HTTP access
  dynamic "ingress" {
    for_each = var.enable_http ? [1] : []
    content {
      description = "Allow HTTP"
      from_port   = var.port.http
      to_port     = var.port.http
      protocol    = var.protocol
      cidr_blocks = var.allowed_http_cidr
    }
  }

  # Egress rule to allow all outbound traffic
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name      = var.sg_name
    ManagedBy = "Terraform"
  }
}

