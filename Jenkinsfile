pipeline {
	agent any
	
	environment {
		IMAGE_NAME = "nodejs-devops-app"	
	}


	stages {
		
		stage("checkout") {
			steps {
				checkout scm
			}
	}


	stage("Build Docker Image") {
		steps {
        		sh """
          			docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .
        		"""
      		}
    	}

    	stage("Smoke Test") {
      		steps {
        		sh """
          			docker run -d -p 3001:3000 --name test-${BUILD_NUMBER} ${IMAGE_NAME}:${IMAGE_TAG}
          			sleep 5
          			docker ps | grep test-${BUILD_NUMBER}
        		"""
      		}
    	}

    	stage("Cleanup") {
      		steps {
        		sh """
          			docker rm -f test-${BUILD_NUMBER} || true
        		"""
      		}
    	}
  
	}

  	post {
    		success {
      			echo "CI pipeline completed successfully ✅"
    		}
    		failure {
      			echo "CI pipeline failed ❌"
    		}
  	}
}
