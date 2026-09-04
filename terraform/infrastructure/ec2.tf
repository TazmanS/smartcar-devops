resource "aws_key_pair" "main" {
  key_name   = "smartcar-key"
  public_key = file("/home/pi/.ssh/id_ed25519.pub")
}

resource "aws_instance" "control_plane" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.control_plane_instance_type
  key_name      = aws_key_pair.main.key_name
  subnet_id     = aws_subnet.control_plane.id
  # iam_instance_profile = aws_iam_instance_profile.cloudwatch_agent.name

  vpc_security_group_ids = [
    aws_security_group.control_plane.id
  ]

  associate_public_ip_address = true

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  tags = {
    Name    = "smartcar-control-plane"
    Project = "smartcar"
    Role    = "control-plane"
  }
}

resource "aws_instance" "worker" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.worker_instance_type
  key_name      = aws_key_pair.main.key_name
  subnet_id     = aws_subnet.worker.id
  # iam_instance_profile = aws_iam_instance_profile.cloudwatch_agent.name

  vpc_security_group_ids = [
    aws_security_group.worker.id
  ]

  associate_public_ip_address = true

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  tags = {
    Name    = "smartcar-worker"
    Project = "smartcar"
    Role    = "worker"
  }
}
