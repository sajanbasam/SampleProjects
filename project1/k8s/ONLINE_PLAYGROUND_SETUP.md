# Online Playground Setup Guide

This guide explains how to run the project using free online environments like **Killercoda** (Kubernetes) and **Play with Docker**.

## Prerequisites
Since these are remote environments, they cannot access files on your local computer directly. You must:
1. **Push this project to a public GitHub repository**.
2. **Clone the repository** inside the playground.

## Option 1: Killercoda (Kubernetes)
**Best for:** Testing the full Kubernetes deployment.

1. **Open Killercoda**: Go to [Killercoda Kubernetes Playground](https://killercoda.com/play/scenarios/kubernetes).
2. **Clone Your Repo**:
   In the terminal provided by Killercoda, run:
   ```bash
   git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
   cd YOUR_REPO_NAME
   ```
3. **Build the Image**:
   Killercoda environments usually have Docker installed.
   ```bash
   cd app
   docker build -t devops-app:latest .
   ```
4. **Deploy**:
   ```bash
   cd ../k8s
   # Ensure deployment.yaml uses 'imagePullPolicy: Never' or 'IfNotPresent' for local images
   kubectl apply -f deployment.yaml
   kubectl apply -f service.yaml
   ```
5. **Access the App**:
   - Check the NodePort or use port-forwarding:
     ```bash
     kubectl port-forward svc/devops-app-service 8080:80 --address 0.0.0.0
     ```
   - Killercoda provides a "Traffic" or "Ports" menu to open port `8080` in your browser.

## Option 2: Play with Docker (PWD)
**Best for:** Testing the Docker build and container run only.

1. **Open PWD**: Go to [labs.play-with-docker.com](https://labs.play-with-docker.com/) and start a new instance.
2. **Clone Your Repo**:
   ```bash
   git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
   cd YOUR_REPO_NAME/app
   ```
3. **Build & Run**:
   ```bash
   docker build -t devops-app .
   docker run -p 8080:8080 devops-app
   ```
4. **Access**:
   - Click the "8080" link that appears at the top of the page to view your running app.
