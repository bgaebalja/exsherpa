pipeline {
    agent any

    stages {
        stage('Environment Setup') {
            steps {
                script {
                    sh 'chmod +x ./gradlew'
                    def projectName = sh(script: './gradlew -q printProjectName', returnStdout: true).trim()
                    def projectVersion = sh(script: './gradlew -q printProjectVersion', returnStdout: true).trim()
                    env.PROJECT_NAME = projectName
                    env.PROJECT_VERSION = projectVersion
                    env.WAR_PATH = "${WORKSPACE}/build/libs/${env.PROJECT_NAME}-${env.PROJECT_VERSION}.war"
                }
                echo 'Environment variables set'
            }
        }

        stage('Test') {
            steps {
                dir("${WORKSPACE}") {
                    sh './gradlew :clean :test'
                }
                echo 'Tests complete'
            }
        }

        stage('Build') {
            steps {
                sh "chmod u+x ${WORKSPACE}/gradlew"
                dir("${WORKSPACE}") {
                    sh './gradlew :clean :build -x test'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def dockerImageTag = "${env.PROJECT_NAME}:${env.PROJECT_VERSION}"
                    env.DOCKER_IMAGE_TAG = dockerImageTag
                    sh "docker system prune -a -f"
                    sh "docker rmi $DOCKER_HUB_USER_NAME/${dockerImageTag} || true"
                    sh "docker build --no-cache=true --build-arg WAR_FILE=${env.WAR_PATH} -t ${dockerImageTag} -f ${WORKSPACE}/Dockerfile ${WORKSPACE}/build/libs/"
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'DOCKER_HUB_ACCESS_TOKEN', variable: 'DOCKER_HUB_ACCESS_TOKEN')]) {
                        sh '''
                        echo $DOCKER_HUB_ACCESS_TOKEN | docker login -u $DOCKER_HUB_USER_NAME --password-stdin
                        '''
                    }
                    def dockerImageTag = env.DOCKER_IMAGE_TAG
                    sh "docker tag ${dockerImageTag} $DOCKER_HUB_USER_NAME/${dockerImageTag}"
                    sh "docker push $DOCKER_HUB_USER_NAME/${dockerImageTag}"
                }
            }
        }

        stage('Deploy to EC2') {
            steps {
                script {
                    withCredentials([
                        sshUserPrivateKey(credentialsId: 'EC2_DEPLOY_KEY_FOR_EXSHERPA', keyFileVariable: 'EC2_DEPLOY_KEY_FOR_EXSHERPA'),
                        string(credentialsId: 'EXSHERPA_RDS_ENDPOINT', variable: 'EXSHERPA_RDS_ENDPOINT'),
                        string(credentialsId: 'EXSHERPA_SLAVE_DB_CONTAINER_NAME', variable: 'EXSHERPA_SLAVE_DB_CONTAINER_NAME'),
                        string(credentialsId: 'EXSHERPA_REDIS_CONTAINER_NAME', variable: 'EXSHERPA_REDIS_CONTAINER_NAME'),
                        string(credentialsId: 'DB_ROOT_PASSWORD', variable: 'DB_ROOT_PASSWORD'),
                        string(credentialsId: 'EXSHERPA_DB_MASTER_USER_NAME', variable: 'DB_MASTER_USER_NAME'),
                        string(credentialsId: 'EXSHERPA_DB_MASTER_PASSWORD', variable: 'DB_MASTER_USER_PASSWORD'),
                        string(credentialsId: 'EXSHERPA_DB_SLAVE_USER_NAME', variable: 'DB_SLAVE_USER_NAME'),
                        string(credentialsId: 'EXSHERPA_DB_SLAVE_PASSWORD', variable: 'DB_SLAVE_USER_PASSWORD'),
                        string(credentialsId: 'REDIS_PASSWORD', variable: 'REDIS_PASSWORD'),
                        string(credentialsId: 'EXSHERPA_PROJECT_NAME', variable: 'EXSHERPA_PROJECT_NAME'),
                        string(credentialsId: 'SSL_KEY_STORE_PASSWORD', variable: 'SSL_KEY_STORE_PASSWORD')
                    ]) {
                        sh '''
                        #!/bin/bash
                        scp -i "$EC2_DEPLOY_KEY_FOR_EXSHERPA" ${WORKSPACE}/docker-compose.yml ubuntu@$EC2_IP_FOR_EXSHERPA:$EC2_DEPLOY_PATH/
                        ssh -i "$EC2_DEPLOY_KEY_FOR_EXSHERPA" ubuntu@"$EC2_IP_FOR_EXSHERPA" << EOF
                            cd $EC2_DEPLOY_PATH
                            export EC2_IP_FOR_EXSHERPA='${EC2_IP_FOR_EXSHERPA}'
                            export PROJECT_NAME='${PROJECT_NAME}'
                            export PROJECT_VERSION='${PROJECT_VERSION}'
                            export DOCKER_HUB_USER_NAME='${DOCKER_HUB_USER_NAME}'
                            export EXSHERPA_RDS_ENDPOINT='$EXSHERPA_RDS_ENDPOINT'
                            export EXSHERPA_SLAVE_DB_CONTAINER_NAME='$EXSHERPA_SLAVE_DB_CONTAINER_NAME'
                            export EXSHERPA_REDIS_CONTAINER_NAME='$EXSHERPA_REDIS_CONTAINER_NAME'
                            export DB_ROOT_PASSWORD='$DB_ROOT_PASSWORD'
                            export DB_MASTER_USER_NAME='$DB_MASTER_USER_NAME'
                            export DB_MASTER_USER_PASSWORD='$DB_MASTER_USER_PASSWORD'
                            export DB_SLAVE_USER_NAME='$DB_SLAVE_USER_NAME'
                            export DB_SLAVE_USER_PASSWORD='$DB_SLAVE_USER_PASSWORD'
                            export REDIS_PASSWORD='$REDIS_PASSWORD'
                            export EXSHERPA_PROJECT_NAME='$EXSHERPA_PROJECT_NAME'
                            export SSL_KEY_STORE_PASSWORD='$SSL_KEY_STORE_PASSWORD'

                            docker stop \$PROJECT_NAME || true
                            docker rm \$PROJECT_NAME || true
                            docker-compose pull
                            docker-compose up -d --no-recreate
                            << EOF
                        '''
                    }
                }
            }
        }

        stage('Archive Artifacts') {
            steps {
                archiveArtifacts artifacts: "build/libs/*.war", fingerprint: true
                echo 'Artifacts archived'
            }
        }
    }
}
