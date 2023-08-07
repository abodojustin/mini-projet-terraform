variable "availability_zone_ebs" {
  type        = string
  description = "set availability zone"
  default     = "us-east-1b"
}

variable "ebs_size" {
  type        = number
  description = "set size"
  default     = 40
}

variable "maintainer" {
  type    = string
  default = "francis"
}