pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                // Збірка проекту Maven
                sh 'mvn clean install -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Побудова Docker образу
                sh 'docker build -t my-test-project .'
            }
        }

        stage('Run Tests') {
            steps {
                // Запуск контейнера для виконання тестів
                sh 'docker run --rm my-test-project'
            }
        }
    }
}
