# Configure the AWS Provider
provider "aws" {
    region = "us-east-1"
    profile = "aws-terraform"
}

resource "aws_s3_bucket" "S3_basico" {
    bucket = "lfcs-bucket-202303"
    tags = {
      Name = "lfcs-bucket-202303"
      Enviroment = "qa"
    }
}

resource "aws_s3_bucket_acl" "S3_basico-acl" {
  bucket = aws_s3_bucket.S3_basico.id
  acl ="private"
}

resource "aws_instance" "servidor_web" {
  ami = "ami-007855ac798b5175e"
  instance_type = "t2.micro"

  tags = {
    Name = "servidor_web"
  }
}

resource "aws_instance" "servidor_bd" {
  ami = "ami-00c39f71452c08778"
  instance_type = "t2.micro"

  tags = {
    Name = "servidor_bd"
  }
}

resource "aws_instance" "servidor_backend" {
  ami = "ami-00c39f71452c08778"
  instance_type = "t2.micro"

  tags = {
    Name = "servidor_backend"
  }
}


resource "aws_sqs_queue" "terraform-basico-queue" {

    name = "terraform-basico-queue"
    delay_seconds = 90
    max_message_size = 2048
    message_retention_seconds = 86400
    receive_wait_time_seconds = 10


    tags= {
        Enviroment = "lab"

    }
  
}