
# Create a VPC
resource "aws_vpc" "testing" {
  cidr_block = "10.0.0.0/16"
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = "ami-055d15d9cfddf7bd3"
  instance_type          = "t2.micro"
  key_name               = "ncm_us"
  monitoring             = true
  vpc_security_group_ids = ["sg-0fc1e87b"]
  subnet_id              = "subnet-0aed3b6c"
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
