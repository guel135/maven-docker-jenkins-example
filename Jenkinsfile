pipeline {
    agent {label 'dockerplay'}
    stages {
        stage ('hostname'){
            steps
            {
                sh 'hostname'
            }
        }

        stage('Back-end') {
            agent {
                
                docker { 
                    image 'maven'
                    label 'dockerplay'
                 }
            }
            steps {
                //sh 'apk update && apk upgrade && apk add --no-cache bash git openssh'
               // sh 'sudo apt-get update && sudo apt-get install -y git'
                checkout([$class: 'GitSCM', branches: [[name: 'master']], userRemoteConfigs: [[  url: 'https://github.com/guel135/maven-docker-jenkins-example']]])

                sh 'mvn  clean package'
                stash includes: 'target/*.war', name: 'app' 

            }
            			post {
				always {
					//junit allowEmptyResults: true, testResults: "$project/target/surefire-reports/*.xml"
					archiveArtifacts allowEmptyArchive: true, artifacts: "target/*.war"
				}
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