output "control_plane_public_ip" {
  description = "Public IP address of the control plane"
  value       = aws_instance.control_plane.public_ip
}

output "control_plane_private_ip" {
  description = "Private IP address of the control plane"
  value       = aws_instance.control_plane.private_ip
}

output "worker_public_ip" {
  description = "Public IP address of the worker"
  value       = aws_instance.worker.public_ip
}

output "worker_private_ip" {
  description = "Private IP address of the worker"
  value       = aws_instance.worker.private_ip
}
