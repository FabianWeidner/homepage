# Verwenden Sie ein offizielles Node.js-Image als Basis
FROM node:alpine

# Setze das Arbeitsverzeichnis
WORKDIR /app

# Kopiere package.json und package-lock.json in das Arbeitsverzeichnis
COPY package*.json ./

# Installiere Abhängigkeiten
RUN npm ci

# Kopiere den restlichen Anwendungscode in das Arbeitsverzeichnis
COPY . .

# Baue die Next.js-Anwendung
RUN npm run build

# Setze die Umgebungsvariable für den Produktionsmodus
ENV NODE_ENV development

# Exponiere den Port, auf dem die Anwendung läuft
EXPOSE 3000

# Starte die Anwendung
CMD ["npm", "run", "dev"]
