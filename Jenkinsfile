pipeline {

  environment {
    dockerimagename = "gcasali01/webapp"
    dockerImage = ""
  }

  agent any

  stages {

  

    stage('Deploying Webapp container to Kubernetes') {
      steps {
        script {
          kubernetesDeploy(configs: "pod.yml")
        }
      }
    }

  }

}
