pipeline {
  agent any
  stages {
    stage('Start') {
      steps {
        echo 'Build starts now'
         sh "export M2_HOME='D:\\Maven\\apache-maven-3.6.0'"
        sh "export JAVA_HOME='C:\\Program Files\\Java\\jdk1.6.0_45'"
        sh 'bash  D:\\Maven\\apache-maven-3.6.0\\bin\\mvn clean install deploy -DskipTests=true -Drevision=0.3-SNAPSHOT'
      }
    }
    
    stage('Docker build') {
      steps {
        sh 'docker build -t $registry:latest .'
      }
    }
    stage('Tag Docker Image') {
      steps {
        sh 'docker tag $registry:latest $registry:$BUILD_NUMBER'
      }
    } 
	 stage('Run Docker Image') {
      steps {
        sh 'docker run $registry:latest $registry:$BUILD_NUMBER'
      }
    } 
  }
  environment {
    registry = 'test-mvc'
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  }
