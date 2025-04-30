pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'elianab/my-web-app' // Docker Hub image name
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Elian7773/MyWebApp.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Building the project...'
                // For example, if you're using npm, you can do: sh 'npm install'
                // Or for other build steps relevant to your project, add them here
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo 'Building Docker image...'
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    echo 'Pushing Docker image to Docker Hub...'
                    // Login to Docker Hub using Jenkins credentials
                    sh 'docker login -u $elianab -p $Year_2004_'
                    sh 'docker push $DOCKER_IMAGE'
                }
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
