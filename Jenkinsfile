pipeline {
    agent {label 'dockerplay'}
    stages {
        stage ('hostname'){
            steps
            {
                sh 'hostname'
            }
        }


        stage ('docker-build'){
            steps
            {
                unstash 'app'
                sh 'pwd'
                sh 'ls'
                sh 'docker build -t tomtest .'
            }
        }
        stage ('clean-ws'){
            steps
            {
                cleanWs()
            }
        }
    }
}