pipeline {
    agent any

    environment {
        IMAGE_NAME = "flask-app"
        IMAGE_TAG  = "latest"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                  docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .
                '''
            }
        }

        stage('Load Image to Minikube') {
            steps {
                sh '''
                  minikube image load ${IMAGE_NAME}:${IMAGE_TAG}
                '''
            }
        }

        stage('Deploy with Helm') {
            steps {
                sh '''
                  helm upgrade --install flask-app ./my-app \
                    --set image.repository=${IMAGE_NAME} \
                    --set image.tag=${IMAGE_TAG}
                '''
            }
        }

        stage('Verify Deployment') {
            steps {
                sh '''
                  kubectl get pods
                  kubectl get svc
                '''
            }
        }
    }
}
