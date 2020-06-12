variable amis {
    type = map
    default = {
        "us-east-1" = "ami-085925f297f89fce1"
        "us-east-2" = "ami-026dea5602e368e96"
    }
}

variable "cdirs_acesso_remoto" {
    type = list
    default = ["201.17.110.192/32", ]
  
}

variable "key_name" {
    default = "terraform1"
}

