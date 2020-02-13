pipeline {
  agent any
  stages {
    stage('Start') {
      steps {
        echo 'Build starts now'
         bat "SET M2_HOME='D:\\Maven\\apache-maven-3.6.0'"
        bat "SET JAVA_HOME='C:\\Program Files\\Java\\jdk1.6.0_45'"
        bat 'D:\\Maven\\apache-maven-3.6.0\\bin\\mvn install deploy -Dhttps.protocols=TLSv1.2 package -DskipTests=true && exit %%ERRORLEVEL%%'
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
