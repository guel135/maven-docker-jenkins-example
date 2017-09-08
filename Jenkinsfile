pipeline {
    agent any
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
                stash includes: 'target/*.war', name: 'app' 

            }
            			post {
				always {
					//junit allowEmptyResults: true, testResults: "$project/target/surefire-reports/*.xml"
					archiveArtifacts allowEmptyArchive: true, artifacts: "target/*.war"
				}
			}
        }
        stage('nothing') {
            agent {
                docker { 
                    reuseNode false
                    image 'tomcat:8.0-jre8-alpine'}
            }
            steps {
                //unstash 'app'
                sh 'ls'
            }
        }
        stage ('docker-build'){
            steps
            {
                sh 'docker build -t tomtest .'
            }
        }
    }
}