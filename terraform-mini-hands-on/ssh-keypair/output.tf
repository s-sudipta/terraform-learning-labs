output "public_key" {
  value = aws_key_pair.ssh_key_pair.public_key
  description = "The public key of the SSH key pair."
}