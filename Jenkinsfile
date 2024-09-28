pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'mi-aplicacion-node:latest'  // Nombre de la imagen Docker
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/ajvitoria/proyectonode.git'
            }
        }
        stage('Construyendo Docker Image') {
            steps {
                script {
                    node('WINDOWS-AGENT-1') {
                        def cmd_command = "cmd /c echo hello"
                        cmd_command.execute()
                    }
                    echo 'Hello, Jenkins'
                    tree
                    
                    
                  //   bat 'echo Hola, este es un mensaje desde el script de Jenkins'
                    //echo PASANDO POR AQUI
                 //   bat 'echo pasando por aqui'
                //    bat 'dir'  // Lista el contenido del directorio 
                    
                 //   docker.build(DOCKER_IMAGE)
                }
            }
        }
        stage('Ejecutando Conteneddor Docker Container') {
            steps {
                script {
                    sh 'docker stop mi-aplicacion-node || true'  // Detener el contenedor si está corriendo
                    sh 'docker rm mi-aplicacion-node || true'  // Eliminar el contenedor si existe
                    sh "docker run -d --name mi-aplicacion-node -p 3000:3000 ${DOCKER_IMAGE}"  // Correr el nuevo contenedor
                }
            }
        }
    }

    post {
        always {
            echo 'Proceso terminado'
        }
    }
}
