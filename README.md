# Lab FuseFS (S3 as file system)

This project is a simple Terraform lab for provide a EC2 and S3 bucket, with instance profile to test the FuseFS.

This is a practical complement for this article (in french) : [damyr.fr](https://www.damyr.fr/posts/fuse-fs/)

## Version

* Terraform : 1.0.5

## Usage

For using this labs follow all there simple steps

```bash
TF_VAR_ssh_key="$YOUR_SSH_PUB_KEY"
terraform init
terraform apply
```

Get the public IP (show on terraform output), and connect to the EC2 using SSH

`ssh admin@$IP`

Enjoy ;)
