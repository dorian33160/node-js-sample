# Utiliser l'image officielle de Node.js
FROM node:18

# Définir le répertoire de travail
WORKDIR /app

# Copier uniquement les fichiers package.json et package-lock.json
COPY package*.json ./

# Installer les dépendances
RUN npm install --omit=dev

# Copier le reste des fichiers du projet
COPY . .

# Donner les permissions d'exécution au fichier bin/www
RUN chmod +x ./bin/www

# Exposer le port sur lequel l'application écoute
EXPOSE 8080

# Lancer l'application
CMD ["node", "bin/www"]
