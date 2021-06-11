pipeline {
    agent any

    stages {
        stage('Validate') {
            steps {
                echo 'validating1..'
		sh 'mvn compile'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
		sh 'mvn test'
		sh 'mvn sonar:sonar -Dsonar.host.url=http://3.238.87.228:9000 -Dsonar.login=5dd0b4d2b811920003922fa2875e068134af4a15'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
		sh 'mvn package'
		sh 'mvn deploy'
		deploy adapters: [tomcat7(credentialsId: 'deploy', path: '', url: 'http://35.172.203.253:9090/')], contextPath: 'calculator', onFailure: false, war: '**/*.war'
		sh 'cp /var/lib/jenkins/workspace/project1pipe/target/*.war ~'
	    }
        }
    }
}
