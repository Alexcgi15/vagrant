# Étape 1 – Construction de l'app avec Node.js
FROM node:24-alpine as build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# Étape 2 – Image finale NGINX
FROM nginx:alpine

# Supprimer la config par défaut de NGINX
RUN rm -rf /usr/share/nginx/html/*

# Copier le build généré dans le dossier NGINX
COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]