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

               // script {
                 //   bat "dir"
  
                    echo 'HOOOOOOLA, Jenkins'
                    docker.image('jenkins/jenkins').inside{
                        sh 'ls -l .'
                    }
                     echo 'ADIOS, Jenkins'
                
                  //   bat 'echo Hola, este es un mensaje desde el script de Jenkins'
                    //echo PASANDO POR AQUI
                 //   bat 'echo pasando por aqui'
                //    bat 'dir'  // Lista el contenido del directorio 
                    
                 //   docker.build(DOCKER_IMAGE)
                }
            }
        }
       stage('LISTANDO IMAGENES DOCKER') {
            steps {
                script {
                    echo 'Listando IMAGENES DOCKER'
                    docker images  // Detener el contenedor si está corriendo

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
