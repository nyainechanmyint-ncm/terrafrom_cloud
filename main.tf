
# Create a VPC
resource "aws_vpc" "testing" {
  cidr_block = "10.0.0.0/16"
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = "ami-06fb6b98af3176846"
  instance_type          = "t2.micro"
  key_name               = "ncm_us"
  monitoring             = true
  vpc_security_group_ids = ["sg-e48461db"]
  subnet_id              = "subnet-7a413e37"
  #source_ami_region = "ap-southeast-1"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
#output "instance_ip_addr" 
#{  
#value       = aws_instance.server.private_ip  
#description = "The private IP address of the main server instance."
#}
}
