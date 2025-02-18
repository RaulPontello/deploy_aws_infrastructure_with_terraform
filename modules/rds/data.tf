# Get the user's public IP

data "http" "my_ip" {
  url = "https://ifconfig.me/ip"
}

# Get the default VPC ID if needed

data "aws_vpc" "default" {
  count = var.create_custom_vpc ? 0 : 1
  default = true
}