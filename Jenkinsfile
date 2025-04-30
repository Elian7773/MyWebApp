pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'elianab/my-web-app' // Docker Hub image name
    }

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
                // Or for other build steps relevant to your project, add them here
            }
        }

        stage('Build Docker Image') {
    steps {
        script {
            dockerImage = docker.build("elian7773/mywebapp:latest")
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
