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
    
        }
    }
