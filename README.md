---
noteId: "a5ca7980dcd911f1b4705f2fef2b337f"
tags: []

---

# TpDockerOptimisation
TP 2 intégration et déploiements continus


# Etat des lieux
Pour commencer, on créé un .gitignore et un .dockerignore pour ne pas commiter le dossier node_modules ni le copier directement dans le container (évite du temps de build) puisqu'on lance la commande npm install qui génère ce dossier là directement.

Initialement, au build de l'image docker de l'application, la durée de build est de 75.4 secondes. 
Avec le changement de l'image de node:latest en node-20:alpine, le build dure 32.0 secondes. 


# Optimisation de l'application
- Choisir une image légère : node:20-alpine (environ 130 à 135 Mo) à la place de node:latest (424.3 MB)