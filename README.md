---
noteId: "a5ca7980dcd911f1b4705f2fef2b337f"
tags: []

---

# TpDockerOptimisation
TP 2 intégration et déploiements continus


# Etat des lieux
Pour commencer, on créé un .gitignore et un .dockerignore pour ne pas commiter le dossier node_modules ni le copier directement dans le container (évite du temps de build) puisqu'on lance la commande npm install qui génère ce dossier là directement.
