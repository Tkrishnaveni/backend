pipeline{
    agent any
    environment {
       
        appVersion= ''
    }
    stages{
        stage('Read the version') {
             steps{
                  script {
                      def packagejson = readJSON file: 'package.json'
                      appVersion = packagejson.version
                      echo "App version is : ${appVersion}"
                  }

             }

        }
        stage ('install dependencies'){
            steps{
                sh 'npm install'
            }
        }
        stage('Validate Docker access') {
          steps {
        sh 'docker ps'
    }
}
        stage ('Docker build'){
            steps {
                 sh """
                  sudo docker build -t kittukrish/backend:${appVersion} .
                  docker images

                  """
            }
        }
    
        }
    }
