resource "tls_private_key" "private_key" {
    count=0
  algorithm = "RSA"
  rsa_bits = "2048"
}
resource "aws_key_pair" "key_pair" {
    count =0
  key_name = var.name
  public_key = tls_private_key.private_key[0].public_key_openssh
  tags = {
    Name = var.name
  }
}