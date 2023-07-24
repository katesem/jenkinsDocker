pipeline {
    agent none // Встановлюємо агента вручну для того, щоб контролювати Docker
    stages {
        stage('Build Docker Image') {
            agent {
                docker {
                    image 'docker:latest' // Вибираємо Docker образ для виконання цього етапу
                    args '--privileged' // Дозволяємо привілейований доступ для запуску Docker всередині Docker
                    reuseNode false // Запускаємо контейнер для кожного етапу, щоб очистити контекст
                }
            }
            steps {
                script {
                    // Виконуємо команди для збірки Docker-образу на основі Dockerfile
                    bat 'docker build -t your-docker-image .'
                }
            }
        }
        stage('Build and Test') {
            agent any
            steps {
                // Запуск Docker контейнера і збірка і тестування внутрішньо контейнера
                script {
                    def dockerImage = docker.image('your-docker-image')
                    def dockerContainer = dockerImage.run("-p 8080:8080 -e ENV_VAR=value")
                    bat 'mvn clean test'
                }
            }
        }
    }

    post {
        always {
            // Збір Allure звіту з контейнера (замість збору звіту на хост-машині).
            script {
                dockerContainer.copyFrom('target/allure-results', 'target/allure-results')
            }
            allure includeProperties: false, jdk: '', results: [[path: 'target/allure-results']]
        }
    }
}
