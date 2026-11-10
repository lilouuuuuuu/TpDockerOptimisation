FROM node:20-alpine
WORKDIR /app
COPY . /app
RUN npm install
RUN apk update && apk add --no-cache \
    build-base \
    python3 \
    make \
    g++ \
    ca-certificates \
    tzdata
EXPOSE 3000 4000 5000
ENV NODE_ENV=development
RUN npm run build
USER root
CMD ["node", "server.js"]