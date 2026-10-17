pipeline {
    agent any

    environment {
        STUDENT_NAME = 'Dias'
        STUDENT_SURNAME = 'Kuzhakhmetov'
        STUDENT_GROUP = 'IT2310'
        STUDENT_ID = '31935'

        IMAGE_NAME = 'kuzhakhmetov-dias-devops'
        CONTAINER_NAME = 'kuzhakhmetov-dias-jenkins-container'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'chmod +x scripts/Kuzhakhmetov_Dias_system.sh'
                sh 'bash -n scripts/Kuzhakhmetov_Dias_system.sh'
            }
        }

        stage('Test') {
            steps {
                sh 'test -f Dockerfile'
                sh 'test -f app/app.py'
                sh 'grep -q "STUDENT_NAME" app/app.py'
                sh 'echo "Project tests passed"'
            }
        }

        stage('Docker Build') {
            steps {
                sh '''
                    export PATH="/usr/local/bin:/opt/homebrew/bin:$PATH"
                    docker build -t $IMAGE_NAME .
                '''
            }
        }

        stage('Docker Run') {
            steps {
                sh '''
                    export PATH="/usr/local/bin:/opt/homebrew/bin:$PATH"

                    docker rm -f $CONTAINER_NAME 2>/dev/null || true

                    docker run -d \
                      -p 8001:8000 \
                      -e STUDENT_NAME=$STUDENT_NAME \
                      -e STUDENT_SURNAME=$STUDENT_SURNAME \
                      -e STUDENT_GROUP=$STUDENT_GROUP \
                      -e STUDENT_ID=$STUDENT_ID \
                      --name $CONTAINER_NAME \
                      $IMAGE_NAME

                    sleep 2

                    docker ps --filter name=$CONTAINER_NAME
                    docker logs $CONTAINER_NAME
                '''
            }
        }
    }

    post {
        success {
            echo "Student: ${STUDENT_NAME} ${STUDENT_SURNAME}"
            echo "Group: ${STUDENT_GROUP}"
            echo "Student ID: ${STUDENT_ID}"
            echo "Pipeline completed successfully"
        }
    }
}

