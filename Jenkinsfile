pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo "Branch detected: ${env.BRANCH_NAME}"
                sh 'docker build -t website .'
            }
        }
        
        stage('Deploy to Production Port:82') {
            when {
                branch 'master'
            }
            steps {
                script {
                    // Deploy the Docker container
                    sh 'docker run -d -p 82:80 --rm website'
                }
            }
        }

    }
}
