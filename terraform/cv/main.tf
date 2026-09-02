terraform {
  backend "s3" {
    bucket       = "smartcar-devops-terraform-state-2026"
    key          = "cv/terraform.tfstate"
    region       = "eu-central-1"
    use_lockfile = true
  }
}
