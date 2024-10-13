FROM node:18-alpine as base
RUN corepack enable

FROM base as builder

WORKDIR /home/node/app
COPY package*.json ./
COPY pnpm-lock.yaml ./
COPY . .
RUN pnpm install --frozen-lockfile
RUN pnpm build:prod
RUN pnpm payload migrate

FROM base as runtime
ENV NODE_ENV=production
WORKDIR /home/node/app
COPY package*.json  ./
COPY pnpm-lock.yaml ./
COPY --from=builder /home/node/app/.next ./.next
COPY --from=builder /home/node/app/payload.sqlite ./payload.sqlite
RUN pnpm install --prod --frozen-lockfile

EXPOSE 3000

CMD ["pnpm", "start"]