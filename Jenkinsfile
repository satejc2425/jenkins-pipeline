pipeline{
  agent any
    environment{
      CONTAINER_NAME = 'myapp-container'
      TAG = 'v1'
      PORT = '5001'
      IMAGE_NAME = 'myapp'
    }
  stages{
    stage('Checkout'){
      checkout scm
    }
    stage('Build docker image'){
      steps{
        script{
          sh "docker rmi -f ${IMAGE_NAME}:${TAG}" || true
          sh "docker build -t ${IMAGE_NAME}:${TAG} . "
        }
      }
    }
  }
post{
  success{
    echo "Image '${IMAGE_NAME}:${TAG}' built successfully"
  }
  failure{
    echo "Image '${IMAGE_NAME}:${TAG}' failed while building"
  }
}
}
