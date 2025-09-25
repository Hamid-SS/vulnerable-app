FROM node:18-alpine

WORKDIR /app
COPY package*.json ./
RUN npm ci

COPY . .
COPY ../config/dev-config.json ./config.json  # ❌ Sirr daxil edilir

EXPOSE 3000

# ❌ root ilə işləyir
CMD ["node", "server.js"]
