# 🚀 DevOps Final Project

A simple Dockerized Python Flask application created as part of my DevOps course final project.  
This project demonstrates basic containerization and orchestration using **Docker** and **Docker Compose**.

---

## 🛠 Tech Stack

- Python 3.10  
- Flask  
- Docker  
- Docker Compose

---

## 📁 Project Structure

finalProject/
└── phase1/
├── app.py
├── Dockerfile
├── requirements.txt
└── docker-compose.yaml

---

## ▶️ Running the App

### 🔹 Option 1: Docker CLI

```bash
# Build the image
docker build -t flask-hello-world ./phase1
```

# Run the container
docker run -p 5000:5000 flask-hello-world
Visit: http://localhost:5000

🔹 Option 2: Docker Compose
```bash
cd phase1
docker-compose up --build
```
Visit: http://localhost:5000

✅ Expected Output
When the app is running, visit the local address to see:
Hello, World!


👩‍💻 Author
Lir Algazi
