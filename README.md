# 🚀 DevOps Final Project

A simple Dockerized Python Flask application created as part of my DevOps course final project.  
This project demonstrates basic containerization and orchestration using **Docker** and **Docker Compose**.

---

## 🛠 Tech Stack

- Python 3.10  
- Flask  
- Docker  & Docker Hub
- Docker Compose
- Kubernetes (minikube)
- ConfigMap & Secret
- Horizontal Pod Autoscaler (HPA)
- Liveness & Readiness Probes
- CronJob
- Metrics Server

---

## 📁 Project Structure

finalProject/
phase1/
├── app.py
├── Dockerfile
├── requirements.txt
├── docker-compose.yaml
├── flask-deployment.yaml
├── flask-service.yaml
├── flask-hpa.yaml
├── flask-config.yaml
├── flask-secret.yaml
├── flask-cronjob.yaml

---

## ▶️ Running the App

### 🔹 Option 1: Run locally with Docker

```bash
# Build the image
docker build -t flask-hello-world ./phase1
```

#### Run the container
```bash
docker run -p 5000:5000 flask-hello-world
```

### 🔹 Option 2: Run from Docker Hub
```bash
docker pull liroosh/flask-hello-world:latest
docker run -p 5000:5000 liroosh/flask-hello-world:latest
```

Visit: http://localhost:5000

## ☸️ Deploy on Kubernetes
```bash
minikube start
# enable metric-server
minikube addons enable metrics-server
# load image to minikube
minikube image load liroosh/flask-hello-world:latest
# apply all K8S menifests
kubectl apply -f k8s/config.yaml
kubectl apply -f k8s/secret.yaml
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl apply -f k8s/hpa.yaml
kubectl apply -f k8s/cronjob.yaml
# expose the service
minikube service k8s/service
```

## ✅ Health & Monitoring

- HPA: Scales based on CPU usage
- Probes: Ensures pods are healthy and ready
- ConfigMap/Secret: Separates config and sensitive data
- CronJob: Automates recurring tasks

✅ Expected Output
When the app is running, visit the local address to see:
Hello, World!


👩‍💻 Author
Lir Algazi

 Logo coming soon
This is the official version
