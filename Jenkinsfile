pipeline{
  agent any
    environment{
      TAG = 'v1'
      IMAGE_NAME = 'myapp'
    }
  stages{
    stage('Checkout'){
      steps{
        checkout scm
      }
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
