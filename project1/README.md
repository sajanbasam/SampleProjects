# End-to-End DevOps Project (Java Edition)

This project demonstrates a complete DevOps lifecycle for a Java Spring Boot application, capable of running on both **Local Kubernetes (Free)** and **AWS Cloud**.

## Features
- **Application**: Java 17 + Spring Boot 3 REST API.
- **Containerization**: Docker (Multi-stage Maven build).
- **Infrastructure**:
  - **Local**: Minikube / Kind (Zero Cost).
  - **Cloud**: AWS EKS & VPC via Terraform (Production Ready).
- **CI/CD**: GitHub Actions (Maven -> Docker -> EKS).
- **Observability**: Prometheus & Grafana.

## Folder Structure

```
.
├── .github/workflows   # CI/CD Pipelines
├── app                 # Java Spring Boot Source Code & Dockerfile
├── k8s                 # Kubernetes Manifests & Local Setup Guide
├── monitoring          # Observability Setup Instructions
├── terraform           # Infrastructure as Code (AWS)
└── trivy.yaml          # Security Scan Config
```

## Quick Start

### Option A: Free / Local (Minikube)
1. **Install Prerequisites**: Docker, Minikube (or Kind), kubectl.
2. **Start Cluster**: `minikube start`
3. **Guide**: Follow [k8s/LOCAL_SETUP.md](k8s/LOCAL_SETUP.md).

### Option B: Online Playgrounds (Killercoda / Play with Docker)
**No installation required.**
1. Push this code to GitHub.
2. Follow the guide in [k8s/ONLINE_PLAYGROUND_SETUP.md](k8s/ONLINE_PLAYGROUND_SETUP.md).

## Cloud Deployment (AWS)

1. **Provision Infrastructure**:
   ```bash
   cd terraform
   terraform init && terraform apply
   ```
2. **Configure kubectl**:
   ```bash
   aws eks update-kubeconfig --name devops-project-eks --region us-east-1
   ```
3. **Deploy via CI/CD**:
   - Push to GitHub.
   - Add Secrets: `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`.
   - The pipeline will automatically build and deploy.

## Observability

Follow [monitoring/README.md](monitoring/README.md) to install Prometheus and Grafana on your cluster (works for both Local and Cloud).

## Security

- **Scanning**: Trivy scans filesystem and container images in CI.
- **Least Privilege**: IAM roles (Cloud) and RBAC (K8s).
