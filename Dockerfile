FROM node:20.9.0-alpine AS builder

COPY . ./

RUN npm ci

RUN npm run build

RUN rm -rf node_modules

EXPOSE 3000

CMD ["node", "./.output/server/index.mjs"]