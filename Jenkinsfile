node {
    def cwk2
    def ip = -172-31-18-127
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
    def ssh = 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDF5UHCntgmyi3UFJN2Wu6crAm4ovJkbgGek1NndqVWQsM+W/fSt2b9G7kmDJRqzX3w1Ozj9J1xO1nUVNfGPVmLy9HKDSSTZ0vUEvzQsng7uFt3KiN9WeYc1cbnTeZUCCw0MZID8qEpJTomc3llPnMsV7gY19Jgi2hJdQrDTOry+z3RGdv6uF7Sgrz0JSvtle7saZWUDxLo6SC0hnWL5NtHD4rp4KxKwo2z+Q2QxZos7YO1hYFgrHGfgaN59SBuDEmmiWG8/GzVV5Ip8mUPSD/DkW+sLeEm7BmuVoYqvEaaph/DEGwZZIh7mrye2JRbbuKI93cQTHw2mTvI8uqkgwtp ubuntu@ip-172-31-18-127'
    sh 'ssh -o StrictHostKeyChecking=no ubuntu@$ip kubectl set image nkier200/nodejs-cw2 cwk2=$imageName:$version'
  }
}   
}
