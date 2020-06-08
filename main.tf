provider "aws" {
  version = "~> 2.0"
  region = "us-east-1"
}

resource "aws_instance" "dev" {
  count = 3
  ami = "ami-085925f297f89fce1"
  instance_type = "t2.micro"
  key_name = "terraform1"
  tags = {
      Name = "dev${count.index}"
  }

  vpc_security_group_ids = ["sg-0ed73ba77e966e07f"]
}

resource "aws_security_group" "acesso-ssh" {
  name = "acesso-ssh"
  description = "acesso-ssh"

  ingress{
      from_port = 22
      to_port   = 22
      protocol  = "tcp"
      cidr_blocks = ["201.17.110.192/32"]
  }

  tags = {
      Name = "ssh"
  }
}


