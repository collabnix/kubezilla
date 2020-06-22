
terraform {
  required_version = "~> 0.12.0"
}

variable "ami" {
  default = "ami-068663a3c619dd892"
}

variable "instance_count" {
  default = "2"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "ssh_key_home" {
  default = "~/.ssh"
}

provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
  profile = "kubezilla"
}

data "template_file" "installation_file" {
  count         = "${var.instance_count}"
  template = file("${path.module}/install_kubernetes.sh")

  vars = {
      server_name = "kubezilla-alvyl-${count.index + 1}"
  }
}

resource "aws_key_pair" "setup_key_pair" {
  key_name   = "kubezilla"
  public_key = file("${var.ssh_key_home}/kubezilla.pub")
}

resource "aws_instance" "my-instance" {
  count         = var.instance_count
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.setup_key_pair.key_name
  user_data     = data.template_file.installation_file[count.index].rendered

  tags = {
    Name  = "kubezilla-alvyl-${count.index + 1}"
  }
}