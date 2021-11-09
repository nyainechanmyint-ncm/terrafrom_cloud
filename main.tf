
# Create a VPC
resource "aws_vpc" "testing" {
  cidr_block = "10.0.0.0/16"
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = "ami-0133407e358cc1af0"
  instance_type          = "t2.micro"
  key_name               = "user1"
  monitoring             = true
  vpc_security_group_ids = ["sg-e48461db"]
  subnet_id              = "subnet-7a413e37"
  #source_ami_region = "ap-southeast-1"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
