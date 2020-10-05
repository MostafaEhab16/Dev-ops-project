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
        withDockerRegistry([url: "", credentialsId: "dockerhub_id"]) {
          sh 'docker login'  
          sh 'docker tag  mostafa-hello mostafa16/mostafa-hello'  
          sh 'docker push mostafa16/mostafa-hello'  
        }
      }
    }
    stage('Deploy Container') {
      steps {
        withAWS(region:'us-east-2',credentials:'user-aws') {
          sh 'aws eks update-kubeconfig --name devops-capstone-cluster'
          sh 'kubectl config use-context arn:aws:eks:us-east-2:653404899093:cluster/devops-capstone-app'
          sh 'kubectl apply -f deploy.yml'
        }
      }
    }
  }
}