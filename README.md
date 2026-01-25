# 🚀 DevOps Final Project (Phase 3)

A simple Dockerized **Python Flask** app deployed to **Kubernetes (Minikube)** using **Helm** and automated by **Jenkins**.

## ✅ Phase 3 alignment (what changed)
- **Pinned Python dependencies** (reproducible builds).
- **Helm is the single source of truth** for Kubernetes resources (no duplicate raw `k8s/*.yaml`).
- **Docker Compose removed** (not part of the project deliverables).

## 🧰 Tech Stack
- Python 3.10 + Flask
- Docker (image build)
- Kubernetes (Minikube)
- Helm (deploy: Deployment, Service, ConfigMap, Secret, HPA, CronJob)
- Jenkins (CI/CD pipeline)

## 📁 Repository structure
- `app.py` – Flask app
- `Dockerfile` – container build
- `requirements.txt` – pinned dependencies
- `my-app/` – Helm chart
- `Jenkinsfile` – pipeline: build → deploy (Helm)
- `docs/` – Helm chart repository artifacts (index + packaged chart)

## ▶️ Build & run locally (Docker)
```bash
docker build -t liroosh/flask-hello-world:latest .
docker run -p 5000:5000 liroosh/flask-hello-world:latest
```

## ☸️ Deploy to Minikube with Helm
Start Minikube and enable metrics-server (needed for HPA):
```bash
minikube start
minikube addons enable metrics-server
```

Load the image into Minikube (recommended for local clusters):
```bash
minikube image load liroosh/flask-hello-world:latest
```

Install/upgrade the release:
```bash
helm upgrade --install my-flask ./my-app   --set image.repository=liroosh/flask-hello-world   --set image.tag=latest
```

Get service URL:
```bash
minikube service my-flask --url
```

## 🔧 Helm values you can customize
Edit `my-app/values.yaml`:
- `replicaCount`
- `service.type` / `service.nodePort`
- `config.*` (ConfigMap)
- `secret.*` (Secret)
- `probes.*` (Readiness/Liveness)
- `hpa.*`
- `cronjob.*`

## 👩‍💻 Author
Lir Algazi
