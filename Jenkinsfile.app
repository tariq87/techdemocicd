pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Login to ECR') {
            steps {
                script {
                    def ecrLogin = sh(script: "$(aws ecr get-login --no-include-email --region us-west-2)", returnStdout: true).trim()
                    sh "$ecrLogin"
                }
            }
        }
        stage('Tag Docker Image') {
            steps {
                sh 'docker tag my-flask-app:latest 123456789012.dkr.ecr.us-west-2.amazonaws.com/demo-deployment:latest'
            }
        }
        stage('Push to ECR') {
            steps {
                sh 'docker push 123456789012.dkr.ecr.us-west-2.amazonaws.com/demo-deployment:latest'
            }
        }
        stage('Deploy to EKS') {
            steps {
                sh 'kubectl apply -f kubernetes/deployment.yaml'
            }
        }
    }
}

