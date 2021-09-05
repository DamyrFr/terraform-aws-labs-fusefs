data "aws_ami" "debian11" {
  most_recent = true
  owners      = ["136693071363"]

  filter {
    name   = "name"
    values = ["debian-11-amd64-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

data "aws_iam_policy_document" "instance_profile" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "bucket_access" {
  statement {
    effect = "Allow"
    actions = [
      "s3:*"
    ]
    resources = [aws_s3_bucket.this.arn]
  }
}

data "aws_vpc" "default" {
  default = true
}
