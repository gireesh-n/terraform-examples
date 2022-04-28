ssh –i vpckeypair ubuntu@<public-dns-name>/public IP address

Create a security.tf file in the previous demo module with below content.
    
 resource "aws_security_group" "security-group1" {
  vpc_id      = aws_vpc.vpc-main.id
  name        = "vpc-main-security-group1"
  description = "security group allows ssh"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "security-group1"
  }
}

  
 Step 2: Create a key.tf file in the previous demo module with below content.x
   
   
 resource "aws_key_pair" "vpckeypair" {
  key_name   = "vpckeypair"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

  
Step 3: Create a instance.tf file in the previous demo module with below content. 
  
  resource "aws_instance" "demo" {
  ami           = "ami-03b8a287edc0c1253"
  instance_type = "t2.micro"
  # VPC subnet
  subnet_id = aws_subnet.vpc-main-public1.id
  # security group
  vpc_security_group_ids = [aws_security_group.secuity-group1.id]
  # public SSH key
  key_name = aws_key_pair.vpckeypair.key_name
}

 Add the below code to var.tf file of the previous demo module.
     
   variable "PATH_TO_PRIVATE_KEY" {
  default = "vpckeypair"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "vpckeypair.pub"
}

   
   
  
