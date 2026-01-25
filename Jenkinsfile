pipeline {
    agent any

    environment {
        APP_NAME   = "flask-app"
        IMAGE_NAME = "flask-app"
        IMAGE_TAG  = "latest"
        HELM_CHART = "./my-app"
        NAMESPACE  = "default"
    }

    options {
        timestamps()
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Sanity Check') {
            steps {
                sh '''
                  echo "=== Jenkins Environment ==="
                  whoami
                  docker --version
                  kubectl version --client
                  helm version
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                  echo "=== Building Docker image ==="
                  docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .
                '''
            }
        }

        stage('Deploy with Helm') {
            steps {
                sh '''
                  echo "=== Deploying with Helm ==="
                  helm upgrade --install ${APP_NAME} ${HELM_CHART} \
                    --namespace ${NAMESPACE} \
                    --set image.repository=${IMAGE_NAME} \
                    --set image.tag=${IMAGE_TAG}
                '''
            }
        }

        stage('Verify Deployment') {
            steps {
                sh '''
                  echo "=== Verifying deployment ==="
                  kubectl get pods -n ${NAMESPACE}
                  kubectl get svc  -n ${NAMESPACE}
                '''
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline completed successfully"
        }
        failure {
            echo "❌ Pipeline failed"
        }
    }
}
