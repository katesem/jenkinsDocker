pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("your-docker-image-tag", "path/to/your/Dockerfile")
                }
            }
        }
        stage('Run Tests in Docker Container') {
            steps {
                script {
                    dockerContainer = dockerImage.run("-p 9090:8080 -e ENV_VAR=value")
                }
            }
        }
        stage('Run Tests') {
            steps {
                script {
                    dockerContainer.inside {
                        bat 'mvn clean test'
                    }
                }
            }
        }
    }

    post {
        always {
            // Збирання Allure звіту з контейнера (замість збору звіту на хост-машині).
            script {
                dockerContainer.copyFrom('target/allure-results', 'target/allure-results')
            }
            allure includeProperties: false, jdk: '', results: [[path: 'target/allure-results']]
        }
    }
}