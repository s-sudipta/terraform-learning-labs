variable "region" {
  description = "The AWS region to create resources in"
  type        = string

  validation {
    condition     = length(var.region) > 0
    error_message = "The region variable must not be empty."
  }
}

variable "key_name" {
  description = "The name of the SSH key pair to create"
  type        = string
}