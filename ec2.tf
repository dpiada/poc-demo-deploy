data "aws_ami" "base-image" {
  most_recent = true

  filter {
    name   = "name"
    values = ["base-machine-ami"]
  }
}

resource "aws_security_group" "demo-sg" {
  name        = "poc-demo-deploy-sg"
  description = "Allow all inbound traffic"

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_instance" "ec2_machine" {
    count = 1

    ami = data.aws_ami.base-image.id 
    instance_type = var.machine-instance-type
    vpc_security_group_ids = [aws_security_group.demo-sg.id]

    root_block_device {
      volume_size = 16 #GB
    }

    user_data_base64 = var.user_data_base64
    user_data_replace_on_change   = true

    tags = {
      Name = var.project_name
      Project = "Demo"
      Deploy_type = "open-tofu"
      Gitlab_repo = "poc-demo-deploy"
    }
}
