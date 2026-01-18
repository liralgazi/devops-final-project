pipeline {
    agent any

    environment {
        IMAGE_NAME = "liroosh/flask-hello-world:latest"
    }

    stages {
        stage('Build Docker Image') {
            steps {
                echo '🔨 Building Docker image...'
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Deploy with Helm') {
            steps {
                echo '🚀 Deploying to Minikube with Helm...'
                sh '''
                helm upgrade --install my-flask ./my-app \
                  --set image.repository=liroosh/flask-hello-world \
                  --set image.tag=latest
                '''
            }
        }
    }
}
