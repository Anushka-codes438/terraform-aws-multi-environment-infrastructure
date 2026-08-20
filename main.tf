module "dev-infrastructure" {
  source         = "./infra-app"
  env            = "dev"
  bucket_name    = "app-bucket"
  instance_count = 1
  instance_type  = "t2.micro"
  aws_ami_id     = "ami-0ac7b260cf76d8865" # Amazon Linux
  hash_key       = "studentID"


}

module "prd-infrastructure" {
  source         = "./infra-app"
  env            = "prd"
  bucket_name    = "app-bucket"
  instance_count = 2
  instance_type  = "t2.medium"
  aws_ami_id     = "ami-0ac7b260cf76d8865" # Amazon Linux
  hash_key       = "studentID"


}
module "stg-infrastructure" {
  source         = "./infra-app"
  env            = "stg"
  bucket_name    = "app-bucket"
  instance_count = 1
  instance_type  = "t2.small"
  aws_ami_id     = "ami-0ac7b260cf76d8865" # Amazon Linux
  hash_key       = "studentID"


}