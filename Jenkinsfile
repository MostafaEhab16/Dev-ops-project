pipeline {
  agent any
  stages {
    stage("Install") {
      steps {
        sh 'npm install'  
      }
    }
    stage("Lint") {
      steps {
        sh 'npm lint'  
      }
    }
    stage("test") {
      steps {
        sh 'npm test'  
      }
    }
    stage("Build Docker image") {
      steps {
        sh 'docker build -t mostafa-hello .'
      }
    }

    stage("Push Dcoker image") {
      steps {
        withDockerRegistry([url: "", credentialsId: "docker-creds"]) {
          sh 'docker login'  
          sh 'docker tag  mostafa-hello mostafaehab16/Mostafa_Devops'  
          sh 'docker push mostafaehab16/Mostafa_Devops'  
        }
      }
    }
    stage('Deploy Container') {
      steps {
        withAWS(region:'us-east-2',credentials:'aws-creds') {
          sh 'aws eks update-kubeconfig --name Mostafa_Devops'
          sh 'kubectl config use-context arn:aws:eks:us-east-2:205696078143:cluster/Mostafa_Devops'
          sh 'kubectl apply -f deploy.yml'
        }
      }
    }
  }
}
