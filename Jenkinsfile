pipeline {
    agent {
      label 'dev'
     }

    environment {
        GIT_REPO = 'https://github.com/<your-username>/<your-app-repo>.git'
        GIT_BRANCH = 'main'
        SONARQUBE = 'SonarQubeServer'          // Name of SonarQube server in Jenkins
        NEXUS_URL = 'http://<nexus-server>:8081/repository/maven-releases/'
        NEXUS_CREDENTIALS = 'nexus-cred-id'
        NEXUS_GROUP = 'com.example'
        NEXUS_ARTIFACT = 'myapp'
        TOMCAT_DEV_URL = 'http://<dev-server>:8080/manager/text'
        TOMCAT_TEST_URL = 'http://<test-server>:8080/manager/text'
        TOMCAT_PROD_URL = 'http://<prod-server>:8080/manager/text'
        TOMCAT_CREDENTIALS = 'tomcat-cred-id'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: "${GIT_BRANCH}", url: "${GIT_REPO}"
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv("${SONARQUBE}") {
                    sh 'mvn sonar:sonar'
                }
            }
        }

        stage('Upload Artifact to Nexus') {
            steps {
                sh '''
                    mvn deploy:deploy-file \
                      -DgroupId=${NEXUS_GROUP} \
                      -DartifactId=${NEXUS_ARTIFACT} \
                      -Dversion=1.0.${BUILD_NUMBER} \
                      -Dpackaging=war \
                      -Dfile=target/*.war \
                      -DrepositoryId=nexus \
                      -Durl=${NEXUS_URL}
                '''
            }
        }

        stage('Deploy to Dev') {
            steps {
                sh "sh scripts/deploy_to_tomcat.sh ${TOMCAT_DEV_URL} target/*.war"
            }
        }

        stage('Manual Approval for Test') {
            steps {
                input message: "Promote to Test?"
            }
        }

        stage('Deploy to Test') {
            steps {
                sh "sh scripts/deploy_to_tomcat.sh ${TOMCAT_TEST_URL} target/*.war"
            }
        }

        stage('Manual Approval for Prod') {
            steps {
                input message: "Promote to Prod?"
            }
        }

        stage('Deploy to Prod') {
            steps {
                sh "sh scripts/deploy_to_tomcat.sh ${TOMCAT_PROD_URL} target/*.war"
            }
        }
    }

    post {
        failure {
            echo "Build failed. Use rollback script to restore previous version."
        }
    }
}

