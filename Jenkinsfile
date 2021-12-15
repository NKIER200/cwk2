node {
    def cwk2
    def ip = "34.228.57.219"
    def imageName = "nkier200/nodejs-cwk2"
    def version = "latest5ft4" 
    stage('Clone repository') {
      

        checkout scm
    }

    stage('Build image') {
  
       cwk2 = docker.build("nkier200/nodejs-cwk2:$version")
    }

    stage('Test the image') {
        cwk2.run("docker run --rm --name nodejs-image-demontime2  -p 80:80 -d nkier200/nodejs-cwk2:$version")
        cwk2.inside {
            sh 'node --version'
            sh 'echo "Tests passed"'

        }
    }

    stage('Push new image') {
        
        docker.withRegistry('https://registry.hub.docker.com', 'git') {
            cwk2.push("$version")
        }
    }
    
    stage('Update the deployment') {

    sh "ssh -o StrictHostKeyChecking=no ubuntu@$ip kubectl set image deploy/kubernetes-cwk2 nodejs-cwk2=$imageName:$version"
  
}   
}
