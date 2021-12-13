node {
    def cwk2

    stage('Clone repository') {
      

        checkout scm
    }

    stage('Build image') {
  
       cwk2 = docker.build("nkier200/nodejs-cwk2")
    }

    stage('Test image') {
  
        cwk2 = docker run --rm --name nodejs-image-demontime2  -p 80:80 -d nkier200/nodejs-cwk2
        cwk2.inside {
         
            sh 'echo "Tests passed"'

        }
    }

    stage('Push image') {
        
        docker.withRegistry('https://registry.hub.docker.com', 'git') {
            cwk2.push("${env.BUILD_NUMBER}")
            cwk2.push("latest")
        }
    }
}
