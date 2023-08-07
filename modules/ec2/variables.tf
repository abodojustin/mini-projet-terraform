variable "instancetype" {
  type        = string
  description = "set aws instance type"
  default     = "t2.nano"
}

variable "sg_name" {
  type        = string
  description = "set sg name"
  default     = "NULL"
}

variable "maintainer" {
  type        = string
  default     = "francis"
  description = "maintainer name"
}

variable "ssh_key" {
  type        = string
  default     = "terraform-test"
  description = "name of ssh key"
}

variable "public_ip" {
  type        = string
  default     = "NULL"
  description = "public ip value"
}

variable "AZ" {
  type    = string
  default = "us-east-1b"
}

variable "user" {
  type    = string
  default = "ubuntu"
}

