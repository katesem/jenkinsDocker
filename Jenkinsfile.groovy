pipeline {
    agent any

    stages {
        stage('Build and Test') {
            steps {
                // Крок для збірки проекту та запуску тестів за допомогою Maven
                sh 'mvn clean test'
            }
        }

        // Інші етапи, якщо потрібно
        // ...
    }
}