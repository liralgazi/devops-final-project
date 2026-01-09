pipeline {
    agent any

    environment {
        IMAGE_NAME = "liroosh/flask-hello-world"
        IMAGE_TAG = "latest"
    }

    stages {
        stage('Build') {
            steps {
                echo "Building Docker image..."
                sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
            }
        }

        stage('Test') {
            steps {
                echo "No tests defined. Skipping test stage."
            }
        }

        stage('Push to Minikube') {
            steps {
                echo "Loading image into Minikube..."
                sh 'minikube image load $IMAGE_NAME:$IMAGE_TAG'
            }
        }

        stage('Deploy with Helm') {
            steps {
                echo "Deploying using Helm..."
                sh 'helm upgrade --install my-flask ./my-app'
            }
        }
    }
}

