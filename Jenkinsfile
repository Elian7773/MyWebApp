pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Elian7773/MyWebApp.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Building the project...'
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
                script {
                    // Load the private key using ssh-add
                    sh """
                    eval \$(ssh-agent -s)
                    ssh-add /var/lib/jenkins/workspace/PipeLine@tmp/private_key_8152112537605624583.key
                    """

                    // Deploy the Docker container to EC2
                    sh """
                    ssh -o StrictHostKeyChecking=no ubuntu@3.21.214.223 "docker pull elianab/mywebapp:latest && docker stop mywebapp || true && docker rm mywebapp || true && docker run -d --name mywebapp -p 80:80 elianab/mywebapp:latest"
                    """
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
