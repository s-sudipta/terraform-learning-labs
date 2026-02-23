variable "region" {
  description = "The AWS region to create resources in"
  type        = string

  validation {
    condition     = length(var.region) > 0
    error_message = "The region variable must not be empty."
  }
}

variable "sg_name" {
  description = "The name of the security group"
  type        = string

  validation {
    condition     = length(var.sg_name) > 0
    error_message = "The sg_name variable must not be empty."
  }
}

variable "sg_description" {
  description = "The description of the security group"
  type        = string
  default     = "Security group created by Terraform"
}

variable "allowed_ssh_cidr" {
  description = "List of CIDR blocks to allow access from"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "allowed_http_cidr" {
  description = "List of CIDR blocks to allow access from"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "port" {
  description = "The port to allow access to"
  type        = map(number)
  default = {
    ssh  = 22
    http = 80
  }
}

variable "protocol" {
  description = "The protocol to allow access to"
  type        = string
  default     = "tcp"

}

variable "enable_ssh" {
  description = "Whether to enable SSH access"
  type        = bool
  default     = true
}

variable "enable_http" {
  description = "Whether to enable HTTP access"
  type        = bool
  default     = true
}
