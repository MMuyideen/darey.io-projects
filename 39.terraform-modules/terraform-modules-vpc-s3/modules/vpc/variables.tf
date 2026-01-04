variable "name" {
  type    = string
  default = "example-vpc"
}

variable "cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "tags" {
  type    = map(string)
  default = {}
}
