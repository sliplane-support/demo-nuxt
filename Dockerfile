FROM node:20.9.0-alpine AS builder

WORKDIR /sliplane

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

RUN npm run build

FROM node:20.9.0-alpine AS runner

WORKDIR /sliplane

COPY --from=builder /sliplane/.output ./.output

EXPOSE 3000

CMD ["node", "./.output/server/index.mjs"]