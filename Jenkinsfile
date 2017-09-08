pipeline {
    agent none
    stages {

        stage('Back-end') {
            agent {
                docker { image 'maven' }
            }
            steps {
                //sh 'apk update && apk upgrade && apk add --no-cache bash git openssh'
               // sh 'sudo apt-get update && sudo apt-get install -y git'
                checkout([$class: 'GitSCM', branches: [[name: 'master']], userRemoteConfigs: [[  url: 'https://github.com/guel135/maven-docker-jenkins-example']]])

                sh 'mvn  clean package'

            }
            			post {
				always {
					//junit allowEmptyResults: true, testResults: "$project/target/surefire-reports/*.xml"
					archiveArtifacts allowEmptyArchive: true, artifacts: "target/*.war"
				}
			}
        }
        stage('Front-end') {
            agent {
                docker { image 'node:7-alpine' }
            }
            steps {
                sh 'node --version'
            }
        }
    }
}