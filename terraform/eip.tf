resource "aws_eip" "control_plane" {
  instance = aws_instance.control_plane.id

  tags = {
    Name = "smartcar-control-plane-eip"
  }
}
