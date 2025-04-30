pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Elian7773/MyWebApp.git',
                    credentialsId: 'e219755e-6a8a-4d91-addc-5ed2a267b767'
            }
        }

        stage('Build') {
            steps {
                echo 'Building the project...'
                // For example, if you're using npm, you can do: sh 'npm install'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("elianab/mywebapp:latest")
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-credentials') {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Deploy to EC2') {
            steps {
                sshagent(['e219755e-6a8a-4d91-addc-5ed2a267b767']) {
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@3.21.214.223 "docker pull elianab/mywebapp:latest && docker stop mywebapp || true && docker rm mywebapp || true && docker run -d --name mywebapp -p 80:80 elianab/mywebapp:latest"'
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
