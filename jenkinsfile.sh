
node {  
    def mvnHome = tool name: 'maven-home', type: 'maven'
        stage('SCM-Checkout') { 
                git branch: 'main', credentialsId: 'Git-credentials1', url: 'https://github.com/mikeolivier/tomcat-demo.git' 
                    }
                        stage('mvn-build') { 
                                sh "${mvnHome}/bin/mvn build"
                                    }
                                        stage('mvn-test') { 
                                                sh "${mvnHome}/bin/mvn test"
                                                    }
                                                        stage('mvn-QA') { 
                                                                sh "${mvnHome}/bin/mvn QA"
                                                                    }
                                                                        stage('mvn-package') { 
                                                                                sh "${mvnHome}/bin/mvn package"
                                                                                    }
                                                                                        stage('mvn-deploy') { 
                                                                                                sh "${mvnHome}/bin/mvn deploy"
                                                                                                    }
                                                                                                         stage('Tomcat-deployment') { 
                                                                                                                //  sshagent(['ec2-user']) {
                                                                                                                			sh "scp -o StrictHostKeyChecking=no target/tomcat-demo.war ec2-user@172.31.81.9:/opt/tomcat/webapps"
                                                                                                                					}
                                                                                                                					    }
                                                                                                                					    }
