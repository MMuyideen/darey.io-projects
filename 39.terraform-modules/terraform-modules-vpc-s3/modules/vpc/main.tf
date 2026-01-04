resource "aws_vpc" "this" {
  cidr_block = var.cidr
  tags       = merge({ Name = var.name }, var.tags)
}