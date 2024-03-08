pipeline {
    agent {
        node {
            label 'agent-1'
        }
    }
    options {
        timeout(time:1, unit: 'HOURS')
        disableConcurrentBuilds()
        ansiColor('xterm')
    }
    stages {
        stage('VPC'){
            steps {
                sh """
                    cd 01-vpc
                    terraform init -reconfigure
                    terraform apply -auto-approve
                """
            }
        }
        stage('SG'){
            steps {
                sh """
                    cd 02-sg
                    terraform init -reconfigure
                    terraform apply -auto-approve
                """
            }
        }
        stage('VPN'){
            steps {
                sh """
                    cd 03-vpn
                    terraform init -reconfigure
                    terraform apply -auto-approve
                """
            }
        }
        stage('DB ALB'){
            parallel {
                stage('DB'){
                    steps {
                        sh """
                            cd 04-databases
                            terraform init -reconfigure
                            terraform apply -auto-approve
                        """
                    }
                }
                stage('APP ALB'){
                    steps {
                        sh """
                            cd 05-app-alb
                            terraform init -reconfigure
                            terraform apply -auto-approve
                        """
                    }
                }
            }
        }
        stage('plan'){
            steps {
                sh """
                    cd 01-vpc
                    terraform plan
                """
            }
        }
        stage('Deploy'){
        
            when {
                expression {
                    params.action == 'apply'
                }
            }
            input {
                message "Should we continue?"
                ok "Yes, we should."
            }
            steps {
                sh """
                    cd 01-vpc
                    terraform apply -auto-approve
                """
            }
        }
        stage('Destroy'){
        
            when {
                expression {
                    params.action == 'destroy'
                }
            }
            input {
                message "Should we continue?"
                ok "Yes, we should."
            }
            steps {
                sh """
                    cd 01-vpc
                    terraform destroy -auto-approve
                """
            }
        }
    }
    post {
        failure {
            echo 'Build is Failed'
        }
        success {
            echo 'pipeline is successfully build'
        }
    }
}