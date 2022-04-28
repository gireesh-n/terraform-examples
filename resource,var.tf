#Step 1: Create a provider.tf file with below code snippet.

provider "aws" {
        access_key = var.AWS_ACCESS_KEY
        secret_key = var.AWS_SECRET_KEY
        region = var.AWS_REGION
}
 

#Step 2: Create a resource.tf file with below code snippet.

resource "aws_instance" "demo2" {
    ami = lookup(var.AMIS,var.AWS_REGION)
    instance_type = "t2.micro"
}

#Step 3: Create a vars.tf file with below code snippet.

variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
        type = string
        default = "ap-south-1"
}
variable "AMIS" {
        type = map
        default = {
        ap-south-1 = "ami-03b8a287edc0c1253"
        }
}
#Step 4: Create a terraform.tfvars with below code snippet.

AWS_ACCESS_KEY = "<YOUR-ACCESS-KEY>"
AWS_SECRET_KEY = "<YOUR-SECRET-KEY>"

#Step 5: Execute terraform init

terraform init
#Step 5: Execute terraform validate

terraform validate
#Step 6: Execute terraform plan

terraform plan
#Step 7: Execute terraform apply

terraform apply
#Step 8: Observe the instance deployment in AWS EC2 console.
