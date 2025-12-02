# Observability Setup

## Prometheus & Grafana via Helm

### Prerequisites
- Helm installed
- Kubeconfig configured for the EKS cluster

### Installation

1. **Add Prometheus Community Repo:**
   ```bash
   helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
   helm repo update
   ```

2. **Install Kube Prometheus Stack:**
   This stack includes Prometheus, Grafana, Alertmanager, and node-exporters.
   ```bash
   helm install monitoring prometheus-community/kube-prometheus-stack --namespace monitoring --create-namespace
   ```

3. **Access Grafana:**
   - Get the admin password:
     ```bash
     kubectl get secret --namespace monitoring monitoring-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
     ```
   - Port forward to access the UI:
     ```bash
     kubectl port-forward --namespace monitoring svc/monitoring-grafana 3000:80
     ```
   - Open `http://localhost:3000` in your browser.
   - Login with user `admin` and the password retrieved above.

### ServiceMonitor (Optional)
To scrape metrics from the Go application, ensure the ServiceMonitor CRD is active and add the following label to the Service:
```yaml
labels:
  release: monitoring
```
(Or configure the Prometheus Operator to select your service).
