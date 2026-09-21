FROM node:24-alpine

ENV NODE_ENV=production \
  PUPPETEER_SKIP_DOWNLOAD=1

WORKDIR /app

COPY package.json package-lock.json* ./

RUN npm ci --include=dev

COPY . .

EXPOSE 4173

CMD ["npx", "vite", "--host", "0.0.0.0", "--port", "4173"]
