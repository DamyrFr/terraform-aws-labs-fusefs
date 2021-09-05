provider "aws" {
  region = "eu-west-1"
  default_tags {
    tags = {
      Name     = "fuseS3"
      Provider = "Terraform"
      Type     = "Labs"
    }
  }
}

output "pub_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.this.public_ip
}
