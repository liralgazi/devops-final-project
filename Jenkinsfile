pipeline {
    agent any

    environment {
        IMAGE_NAME = "liroosh/flask-hello-world:latest"
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Test') {
            steps {
                echo 'Testing... (optional)'
                // אם אין בדיקות כרגע, אפשר לדלג או להוסיף בעתיד
            }
        }

        stage('Push to Minikube') {
            steps {
                echo 'Loading image into Minikube...'
                sh 'minikube image load $IMAGE_NAME'
            }
        }

        stage('Deploy with Helm') {
            steps {
                echo 'Deploying with Helm...'
                sh 'helm upgrade --install my-flask my-app'
            }
        }
    }
}
