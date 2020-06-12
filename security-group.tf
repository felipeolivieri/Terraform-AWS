resource "aws_security_group" "acesso-ssh" {
  name = "acesso-ssh"
  description = "acesso-ssh"

  ingress{
      from_port = 22
      to_port   = 22
      protocol  = "tcp"
      cidr_blocks = var.cdirs_acesso_remoto
  }

  tags = {
      Name = "ssh"
  }
}
resource "aws_security_group" "acesso-web" {
    name = "acesso-web"
    description = "acesso web a partir da instancia"

    egress{
        from_port = 0
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "web-int"
    }
}

resource "aws_security_group" "acesso-ssh-us-east-2" {
  provider = aws.us-east-2
  name = "acesso-ssh"
  description = "acesso-ssh"

  ingress{
      from_port = 22
      to_port   = 22
      protocol  = "tcp"
      cidr_blocks = var.cdirs_acesso_remoto
  }

  tags = {
      Name = "ssh"
  }
}
resource "aws_security_group" "acesso-web-us-east-2" {
    provider = aws.us-east-2
    name = "acesso-web"
    description = "acesso web a partir da instancia"

    egress{
        from_port = 0
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "web-int"
    }
}