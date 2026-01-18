pipeline {
    agent any

    environment {
        IMAGE_NAME = "liroosh/flask-hello-world"
    }

    stages {
        stage('Build Docker Image') {
            steps {
                echo '🔨 Building Docker image...'
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Load to Minikube') {
            steps {
                echo '📦 Loading image to Minikube...'
                sh 'minikube image load $IMAGE_NAME'
            }
        }

        stage('Deploy with Helm') {
            steps {
                echo '🚀 Deploying with Helm...'
                sh 'helm upgrade --install my-flask ./my-app'
            }
        }
	stage('Debug') {
    	steps {
        	sh 'echo "PWD:" && pwd'
        	sh 'echo "FILES:" && ls -lah'
        	sh 'which docker || echo "🚫 docker not found"'
        	sh 'docker version || echo "🚫 docker error"'
        	sh 'helm version || echo "🚫 helm not found"'
        	sh 'minikube status || echo "🚫 minikube error"'
    	}
	}

    }
}
