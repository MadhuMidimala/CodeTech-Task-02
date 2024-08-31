provider "aws" {
access_key = "xxxxxxxxxxxxxxx"
secret_key = "xxxxxxxxxxxxxxxxxxxxx"
region = "us-east-2"
}
resource "aws_instance" "Instance-01" {
ami = "var.ami_id"
instance_type = "var.instance_type"
tags = {
Name = "Instance-01"
}
}
