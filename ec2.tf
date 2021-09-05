resource "aws_key_pair" "this" {
  key_name   = "labs_key"
  public_key = var.ssh_key
}

resource "aws_instance" "this" {
  ami                         = data.aws_ami.debian11.id
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  key_name                    = aws_key_pair.this.key_name
  security_groups             = ["${aws_security_group.this.name}"]
  iam_instance_profile        = aws_iam_instance_profile.this.name
}
