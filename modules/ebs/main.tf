resource "aws_ebs_volume" "ebs" {
  availability_zone = var.availability_zone_ebs
  size              = var.ebs_size

  tags = {
    Name = "${var.maintainer}-ebs"
  }
}