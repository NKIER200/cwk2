node {
    def cwk2
    def ip = "ip-172-31-18-127"
    def ssh = 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC2cQnVL7g0YsJkR9h+fnv1TV1G4hUId00ue1d7qu+pFkK/ZkOZ+lcUsVYyf/RuasEYEGCvPzKtAbIvXnMVCtMAR/A3AOaVueNiXYJH5fD7xLqifbSEKIELzhTFWXBD1RnyQkJ6TM5AiQuJ6kJeDB+b/Sm56ocXi+gso8cj98it164EMeXp34Npb8o8+2jKEQjtHmbHlGLPUGh5JR+TYUnhObp8obnY0t+iTMXJLLn+fx0f9+wvn+fCGEsHNY/l6RtzvuGoW5U+0nOsz9niEvWkszu15Pk5kC1IEqRX8M/0g2kGxOy5u1mlviKTgVc0rdUVTZBzjrx/Jt7RawcKLu/t4mQzymO1AP4sUUGCnnKJlL6+m+q985t9CBec1GRvvDqTwQimweB/s/74tWFPw+JsYVGz2F2CXhQruh3ldzi9r/yx5VnwoKZi6ZecxSrieckiBEhzq+0f9rzzw6rHCAgAsa8ZhPaXF+vwKsZaTQoHu0GT5Z56dvWc9w5kzHII4IU= jenkins@e85b0f6064d1'
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

 sh "ssh -o StrictHostKeyChecking=no ubuntu@$ip kubectl set image deploy/nodejs-cwk2 nodejs-image-demontime2:latest"
  
}   
}
