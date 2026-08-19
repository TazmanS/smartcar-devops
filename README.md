# SmartCar DevOps

This repository contains the infrastructure and deployment configuration for the SmartCar project.

The goal of this repository is to automate and manage the SmartCar environment, from cloud infrastructure to application deployment.

## What this repository is responsible for

The repository is used to manage:

- AWS infrastructure
- EC2 instances and networking
- Kubernetes / k3s cluster configuration
- Application deployment
- GitOps with Argo CD
- DNS and domain configuration
- HTTPS and TLS certificates
- Docker-based environments
- Infrastructure as Code with Terraform
- Server configuration with Ansible

## Architecture

The SmartCar application runs in AWS on a Kubernetes cluster.

The general application flow is:

```text
Developer
    |
    v
GitHub
    |
    v
CI/CD
    |
    v
Docker images
    |
    v
Kubernetes
    |
    v
SmartCar
```

Infrastructure is managed through Infrastructure as Code:

```text
Terraform
    |
    +--> AWS
    |
    +--> Cloudflare
```

Server and cluster configuration is handled with Ansible.

Application deployment is managed through Kubernetes and Argo CD.

External traffic goes through Cloudflare and Traefik:

```text
Internet
    |
    v
Cloudflare
    |
    v
AWS
    |
    v
Traefik
    |
    +--> Frontend
    |
    +--> Backend
```

The application is available through a single domain with path-based routing:

```text
https://smartcar.shumilov.dev/
https://smartcar.shumilov.dev/api
https://smartcar.shumilov.dev/swagger
```

HTTPS certificates are automatically managed using cert-manager and Let's Encrypt.

## Why this repository exists

The purpose of `smartcar-devops` is not only to deploy SmartCar, but also to provide a real-world environment for learning and practicing:

- DevOps
- AWS
- Terraform
- Ansible
- Linux
- Kubernetes
- Docker
- CI/CD
- GitOps
- networking
- DNS
- TLS
- cloud infrastructure
- secrets management

The infrastructure is built incrementally as the SmartCar project evolves.

## Planned improvements

The infrastructure will continue to evolve with the project.

Planned areas include:

- Elastic IP
- AWS Secrets Manager
- Terraform remote state
- development and production environments
- monitoring and observability
- additional AWS services
- AWS SageMaker for computer vision workloads
