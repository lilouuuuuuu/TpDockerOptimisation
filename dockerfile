# ==========================================
# STAGE 1 : BUILD
# ==========================================
FROM node:20-alpine AS build

WORKDIR /app

# Outils nécessaires à la compilation des dépendances natives
RUN apk add --no-cache \
    build-base \
    python3

# Installation des dépendances
COPY package*.json ./
RUN npm ci

# Copie du code source
COPY . .

# Compilation de l'application
RUN npm run build


# ==========================================
# STAGE 2 : PRODUCTION
# ==========================================
FROM node:20-alpine AS production

WORKDIR /app

# Dépendances nécessaires à l'exécution
RUN apk add --no-cache \
    ca-certificates \
    tzdata \
    libstdc++

# Récupération de l'application et de ses dépendances depuis le stage build
COPY --from=build /app /app

# Configuration de l'environnement
ENV NODE_ENV=production
USER node
EXPOSE 3000 4000 5000
CMD ["node", "server.js"]