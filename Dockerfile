FROM node:20.9.0-alpine AS builder

COPY . ./

RUN npm ci

RUN npm run build

EXPOSE 3000

CMD ["node", "./.output/server/index.mjs"]