provider "aws" {
  version = "~> 2.0"
  region = "us-east-1"
}

provider "aws" {
  alias = "us-east-2"
  version = "~> 2.0"
  region = "us-east-2"
}

resource "aws_instance" "dev" {
  count = 3
  ami = "ami-085925f297f89fce1"
  instance_type = "t2.micro"
  key_name = "terraform1"
  tags = {
      Name = "dev${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}", "${aws_security_group.acesso-web.id}"]
}

resource "aws_instance" "dev4" {
  ami = "ami-085925f297f89fce1"
  instance_type = "t2.micro"
  key_name = "terraform1"
  tags = {
      Name = "dev4"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}", "${aws_security_group.acesso-web.id}"]
  depends_on = [aws_s3_bucket.dev4]
}

resource "aws_instance" "dev5" {
  ami = "ami-085925f297f89fce1"
  instance_type = "t2.micro"
  key_name = "terraform1"
  tags = {
      Name = "dev5"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}", "${aws_security_group.acesso-web.id}"]
}

resource "aws_instance" "dev6" {
  provider = "aws.us-east-2"
  ami = "ami-026dea5602e368e96"
  instance_type = "t2.micro"
  key_name = "terraform1"
  tags = {
      Name = "dev6"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-2.id}", "${aws_security_group.acesso-web-us-east-2.id}"]
  depends_on = ["aws_dynamodb_table.dynamodb-dev6"]
}


resource "aws_dynamodb_table" "dynamodb-dev6" {
    provider = "aws.us-east-2"
    name = "meu_bd"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "UserId"
    range_key = "MeuDB"

    attribute {
        name = "UserId"
        type = "S"
    }

    attribute {
        name = "MeuDB"
        type = "S"
    }

}

