terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "Olivieri"

    workspaces {
      name = "terraform-aws"
    }
  }
}