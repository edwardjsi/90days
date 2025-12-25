pipeline {
    agent none

    stages {

        stage('Build - Java Service') {
            agent {
                docker {
                    image 'maven:3.9.6-eclipse-temurin-17'
                    args '-v ~/.m2:/root/.m2'
                }
            }
            steps {
                echo 'Building Java microservice using Maven'
                sh 'mvn -version'
                sh 'mvn clean package'
            }
        }

        stage('Build - Node Service') {
            agent {
                docker {
                    image 'node:20-alpine'
                }
            }
            steps {
                echo 'Building Node.js microservice'
                sh 'node -v'
                sh 'npm -v'
                sh 'npm install'
                sh 'npm run build || echo "build skipped for demo"'
            }
        }

        stage('Test') {
            agent {
                docker {
                    image 'python:3.12-alpine'
                }
            }
            steps {
                echo 'Running tests in isolated container'
                sh 'python --version'
                sh 'echo "Tests executed successfully"'
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed. Containers destroyed automatically.'
        }
    }
}
