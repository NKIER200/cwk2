node {
    def cwk2
    def ip = "34.228.57.219"
    def imageName = "nodejs-image-demontime2"
    def version = "latest" 
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

 sh "ssh -o StrictHostKeyChecking=no ubuntu@$ip kubectl set image deploy/nodejs-cwk2 $imageName:$version"
  
}   
}
