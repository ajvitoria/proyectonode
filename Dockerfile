# Usar una imagen base de Node.js
  FROM node:14
 
  # Establecer el directorio de trabajo
  WORKDIR /usr/src/app
 
  # Copiar los archivos package.json y package-lock.json
  COPY package*.json ./
 
  # Instalar dependencias
  RUN npm install
 
  # Copiar el resto de la aplicación
  COPY . .
 
  # Exponer el puerto en el que la aplicación correrá
  EXPOSE 3000
 
  # Comando para ejecutar la aplicación
  CMD ["npm", "start"]
  ```

- **package.json**: Archivo que contiene la configuración del proyecto, incluyendo dependencias y scripts.

  ```json
  {
    "name": "mi-aplicacion-node",
    "version": "1.0.0",
    "main": "app.js",
    "scripts": {
      "start": "node app.js"
    },
    "dependencies": {
      "express": "^4.17.1"
    }
  }