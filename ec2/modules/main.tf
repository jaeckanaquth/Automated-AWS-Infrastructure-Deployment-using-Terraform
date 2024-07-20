#TODO: add a ec2 instance code with a pem key and all security added. Add a role to the instance

resource "aws_iam_role" "ec2_role" {
  name = "ec2_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.name}_ec2_profile"
  role = aws_iam_role.ec2_role.name
}

resource "aws_iam_policy" "ec2_policy" {
  name = "${var.name}_ec2_policy"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = "*",
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ec2_policy_attachment" {
  role = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.ec2_policy.arn
}

resource "aws_instance" "default" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  #add 'Name' as a tag to var.tags
  tags = merge(var.tags, { Name = var.name })
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  #add encrypted boot volume
    root_block_device {
        volume_size = var.volume_size
        volume_type = "gp2"
        encrypted = true
    }
}

#add additional volume
resource "aws_ebs_volume" "additional_volume" {
  availability_zone = var.availability_zone
  size = var.additional_volume_size
  type = "gp2"
  encrypted = true
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id = aws_ebs_volume.additional_volume.id
  instance_id = aws_instance.default.id
}
