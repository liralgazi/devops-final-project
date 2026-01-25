pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Sanity') {
            steps {
                sh '''
                  echo "Running inside Jenkins"
                  kubectl version --client
                  helm version
                '''
            }
        }
    }
}
