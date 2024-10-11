pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        script {
          sh 'mvn clean package'
        }
      }
    }

    stage('SonarQube Analysis') {
      steps {
        script {
          withSonarQubeEnv('MySonarQube') {
            sh 'mvn sonar:sonar'
          }
        }
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
          sh 'docker build -t myapp:latest .'
        }
      }
    }

    stage('Deploy to Kubernetes') {
      steps {
        script {
          sh 'kubectl apply -f k8s/deployment.yaml'
          sh 'kubectl apply -f k8s/service.yaml'
        }
      }
    }
  }
}
