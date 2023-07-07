pipeline {

  environment {
    dockerimagename = "gcasali01/webapp"
    dockerImage = ""
  }

  agent any

  stages {

    stage('Checkout Source') {
      steps {
        git 'https://github.com/gcasali01/jenkins-pipeline.git'
      }
    }

    stage('Build image') {
      steps{
        script {
          dockerImage = docker.build dockerimagename
        }
      }
    }

    stage('Pushing Image') {
      environment {
               registryCredential = 'dockerhub-credentials'
           }
      steps{
        script {
          docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {
            dockerImage.push("latest")
          }
        }
      }
    }

    stage('Deploying Webapp container to Kubernetes') {
      steps {
        script {
          kubernetesDeploy(configs: "pod.yml")
        }
      }
    }

  }

}
