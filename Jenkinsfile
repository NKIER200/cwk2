node {
    def cwk2
    def ip = -172-31-18-127
    def ssh = SHA256:Lk6zZu7rNHyCtIJ/4AL0ARegNKibn07B58a1a2ydJCQ 
    stage('Clone repository') {
      

        checkout scm
    }

    stage('Build image') {
  
       cwk2 = docker.build("nkier200/nodejs-cwk2")
    }

    stage('Test image') {
        cwk2.run()  
        cwk2.inside {
            sh 'node --version'
            sh 'echo "Tests passed"'

        }
    }

    stage('Push image') {
        
        docker.withRegistry('https://registry.hub.docker.com', 'git') {
            cwk2.push("${env.BUILD_NUMBER}")
            cwk2.push("latest")
        }
    }

stage('Update k8s deployment') {
  cwk2.inside {
    sh 'ssh -o StrictHostKeyChecking=no ubuntu@$ip kubectl set image nkier200/nodejs-cw2 cwk2=$imageName:$version'
  }
}   
}
