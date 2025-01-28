pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "build-container"  // Docker image to use
        WORK_DIR = "/var/www/html"        // Directory in the container to store the website
    }
    stages {
        stage('Clone Repository') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                script {
                    echo "Building the website..."
                    sh '''
                    docker run --rm -v $(pwd):${WORK_DIR} ${DOCKER_IMAGE} bash -c "
                    echo 'Build completed!'
                    "
                    '''
                }
            }
        }
        stage('Publish to Port 82') {
            when {
                branch 'master'  // Only run this stage when the branch is master
            }
            steps {
                script {
                    echo "Publishing the website on port 82..."
                    sh '''
                    docker run --rm -p 82:80 -v $(pwd):${WORK_DIR} ${DOCKER_IMAGE} bash -c "
                    echo 'Website published on port 82!'
                    "
                    '''
                }
            }
        }
        stage('Build Complete') {
            steps {
                echo "Build process completed for branch: ${env.BRANCH_NAME}"
            }
        }
    }
}
