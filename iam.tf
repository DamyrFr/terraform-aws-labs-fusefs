resource "aws_iam_instance_profile" "this" {
  name = "fuse_access"
  role = aws_iam_role.this.name
}

resource "aws_iam_role" "this" {
  name               = "fuse_ec2"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.instance_profile.json
}

resource "aws_iam_policy" "this" {
  name        = "fuse_access"
  path        = "/"
  description = "Allow bucket for FuseFS"

  policy = data.aws_iam_policy_document.bucket_access.json
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}
