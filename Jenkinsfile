pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Elian7773/MyWebApp.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Building the project...'
                // Add build commands if applicable (e.g., npm install, etc.)
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying the project...'
                // Add Docker deployment commands or other deployment steps
            }
        }
    }

    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed.'
        }
    }
}
