variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "control_plane_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "worker_subnet_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "control_plane_availability_zone" {
  type    = string
  default = "eu-central-1a"
}

variable "worker_availability_zone" {
  type    = string
  default = "eu-central-1b"
}

variable "control_plane_instance_type" {
  type    = string
  default = "c7i-flex.large"
}

variable "worker_instance_type" {
  type    = string
  default = "t3.small"
}

variable "cloudflare_api_token" {
  type      = string
  sensitive = true
}

variable "cloudflare_zone_id" {
  type = string
}
