pipeline {
    agent any

    environment {
        DOCKER_HUB_USER = 'sanskrutipawar'
        IMAGE_NAME = 'poem-story-app'
        IMAGE_TAG = 'latest'
    }

    stages {
        stage('Clone Repository') {
            steps {
                // ✅ Cloning your GitHub repo
                git 'https://github.com/sanskruti687/storyhub-cicd.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t $DOCKER_HUB_USER/$IMAGE_NAME:$IMAGE_TAG ."
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',  // ✅ Must match Jenkins credentials ID
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh "echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin"
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                sh "docker push $DOCKER_HUB_USER/$IMAGE_NAME:$IMAGE_TAG"
            }
        }
    }

    post {
        success {
            echo "✅ Docker image pushed successfully!"
        }
        failure {
            echo "❌ CI/CD pipeline failed."
        }
    }
}
