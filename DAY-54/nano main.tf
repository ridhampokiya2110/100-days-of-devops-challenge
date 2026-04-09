provider "aws" {
    region = "eu-north-1"
}

data "aws_subnets" "available" {}

resource "aws_s3_bucket" "critical_data" {
    bucket = "day54-critical-data-ridham"

    lifecycle {
        prevent_destroy = true
    }
}

resource "aws_instance" "web_server" {
    ami = "ami-0014ce3e52359afbd"
    instance_type = "t3.micro"
    subnet_id = tolist(data.aws_subnets.available.ids)[0]

    tags = {
        Name = "Day54-ZeroDowntime-Server"
        Env = "Prod"
    }

    lifecycle {
        create_before_destroy = true
        ignore_changes = [tags]
    }
}