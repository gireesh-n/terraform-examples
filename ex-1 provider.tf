provider "aws" {
    access_key="<YOUR-AWS-ACCESS-KEY"
    secret_key="<YOUR-AWS-SECRET-ACCESS-KEY>"
    region="ap-south-1"
}
resource "aws_instance" "Demo1" {
    ami="ami-03b8a287edc0c1253"
    instance_type="t2.micro"
}
