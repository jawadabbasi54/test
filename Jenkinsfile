pipeline {
    agent any
    stages {
        stage('One') {
                steps {
                        echo 'Hi, I am DevOps Engineer from ABODE'
			
                }
        }
	    stage('Two'){
		    
		steps {
			input('Do you want to proceed?')
        }
	    }
        stage('Three') {
                when {
                        not {
                                branch "master"
                        }
                }
                steps {
			echo "Hello"
                        }
        }
        stage('Four') {
                parallel {
                        stage('Unit Test') {
                                steps{
                                        echo "Running the unit test..."
                                }
                        }
			
			 stage('Integration Test') {
                                steps{
                                        echo "Running the Integration test..."
                                }
                        }
                       
		
                               
			}  }
        
    }
}
