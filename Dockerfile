# FROM mgsx/gdx-docker

# WORKDIR /app
# COPY . /app

# RUN ./gradlew lwjgl3:dist

# CMD ["java", "-jar", "/app/lwjgl3/build/lib/lwjgl3-1.0.jar"]



# Utiliser une image de base avec OpenJDK 21
FROM eclipse-temurin:21-jdk-alpine

# Installer les dépendances nécessaires
RUN apk add --no-cache bash

# Définir le répertoire de travail
WORKDIR /app

# Copier tous les fichiers du projet dans le conteneur
COPY . /app

# Donner les permissions d'exécution au script Gradle
RUN chmod +x ./gradlew

RUN ./gradlew lwjgl3:build
RUN mkdir /output && cp lwjgl3/build/libs/*.jar /output
