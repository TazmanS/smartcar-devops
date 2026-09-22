output "control_plane_public_ip" {
  description = "Public IP address of the control plane"
  value       = aws_instance.control_plane.public_ip
}

output "control_plane_private_ip" {
  description = "Private IP address of the control plane"
  value       = aws_instance.control_plane.private_ip
}

output "worker_1_public_ip" {
  description = "Public IP address of the worker 1"
  value       = aws_instance.worker_1.public_ip
}

output "worker_1_private_ip" {
  description = "Private IP address of the worker 1"
  value       = aws_instance.worker_1.private_ip
}

output "worker_2_public_ip" {
  description = "Public IP address of the worker 2"
  value       = aws_instance.worker_2.public_ip
}

output "worker_2_private_ip" {
  description = "Private IP address of the worker 2"
  value       = aws_instance.worker_2.private_ip
}

output "control_plane_eip" {
  description = "Elastic IP of the Kubernetes control-plane"
  value       = aws_eip.control_plane.public_ip
}
