provider "aws" {
  region     = "us-east-1"
  shared_credentials_files = ["/Users/admin/.aws/credentials"]
}

# terraform {
#   backend "s3" {
#     bucket     = "backend-francis-devops"
#     key        = "francis-mini-projet-tfstate"
#     region     = "us-east-1"
#     access_key = "PUT YOUR OWN"
#     secret_key = "PUT YOUR OWN"
#   }
# }

# Création du sg
module "sg" {
  source = "../modules/sg"
}

# Création du volume
module "ebs" {
  source    = "../modules/ebs"
  ebs_size = 5
}

# Création de l'EIP
module "eip" {
  source = "../modules/eip"
}

# Création de l'EC2
module "ec2" {
  source       = "../modules/ec2"
  public_ip    = module.eip.output_eip
  instancetype = "t2.micro"
  sg_name      = module.sg.output_sg_name
}


# Création des association nécessaires
resource "aws_eip_association" "eip_assoc" {
  instance_id   = module.ec2.ec2_id
  allocation_id = module.eip.output_eip_id
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = module.ebs.output_id_volume
  instance_id = module.ec2.ec2_id
}
