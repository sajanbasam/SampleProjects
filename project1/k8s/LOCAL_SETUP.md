# Local Kubernetes Setup

This guide explains how to run the project locally using Minikube or Kind (Kubernetes in Docker), fulfilling the "free resources" requirement.

## Prerequisites
- Docker installed
- Minikube or Kind installed
- kubectl installed

## Option 1: Minikube

1. **Start Minikube**:
   ```bash
   minikube start
   ```

2. **Use Minikube's Docker Daemon** (Optional but recommended for local images):
   - PowerShell: `minikube -p minikube docker-env --shell powershell | Invoke-Expression`
   - Bash: `eval $(minikube docker-env)`
   
   *This allows you to build images directly into Minikube without pushing to a registry.*

3. **Build the Image**:
   ```bash
   cd app
   docker build -t devops-app:latest .
   ```

4. **Deploy**:
   ```bash
   cd k8s
   # Update deployment.yaml to use imagePullPolicy: Never or IfNotPresent if using local image
   kubectl apply -f deployment.yaml
   kubectl apply -f service.yaml
   ```

5. **Access the App**:
   ```bash
   minikube service devops-app-service
   ```

## Option 2: Kind

1. **Create Cluster**:
   ```bash
   kind create cluster --name devops-project
   ```

2. **Build Image**:
   ```bash
   cd app
   docker build -t devops-app:latest .
   ```

3. **Load Image into Kind**:
   ```bash
   kind load docker-image devops-app:latest --name devops-project
   ```

4. **Deploy**:
   ```bash
   cd k8s
   kubectl apply -f deployment.yaml
   kubectl apply -f service.yaml
   ```

5. **Access**:
   - Port-forward:
     ```bash
     kubectl port-forward svc/devops-app-service 8080:80
     ```
   - Visit `http://localhost:8080`
