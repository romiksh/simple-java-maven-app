pipeline {
    agent any 
    stages {
        
        stage('Hello') { 
            steps {
            echo 'Hello from GIT'    
            }
        }
        
        stage('Get Code from GIT') { 
            steps {
                checkout changelog: false, poll: false, scm: [$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/romiksh/simple-java-maven-app.git']]]
            }
        }
        
        stage('Run Test'){
            steps{
                sh 'docker run --rm -v /root/jenkins_home/workspace/testpipe:/app -w /app maven:3-alpine mvn clean test'
            }
        }

        stage('Build JAR'){
            steps{
                sh 'docker run --rm -v /root/jenkins_home/workspace/testpipe:/app -w /app maven:3-alpine mvn clean -DskipTests package'
                sh 'cp ./target/*.jar ./docker/app.jar'
            }
        }
       stage('Build Docker Image'){
            steps{
                sh './jenkins/scripts/builddocker.sh'
            }
        }
    
        stage('Run Dcoker Container'){
            steps{
                sh 'docker run --rm app'
            }
        }
    }
}
