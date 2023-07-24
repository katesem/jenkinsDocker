pipeline {
    agent any

    stages {
        stage('Build and Test') {
            steps {
                bat 'mvn clean test'
            }
        }
}
          post {
               always {
                   //  Allure report
                   allure includeProperties: false, jdk: '', results: [[path: 'target/allure-results']]
               }
           }


    }