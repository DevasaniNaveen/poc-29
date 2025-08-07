provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source     = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
}

# Assume you create subnet manually, or expand vpc module to include it
module "s3" {
  source      = "./modules/s3"
  bucket_name = "terraform-demo-s3-bucket-1234567"
}

module "ec2" {
  source        = "./modules/ec2"
  ami           = "ami-020cba7c55df1f615"   
  instance_type = "t2.micro"
  subnet_id     = module.vpc.subnet_id
}
