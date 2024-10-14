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
COPY --from=builder /home/node/app/.next/standalone ./
COPY --from=builder /home/node/app/.next/static ./.next/static
COPY --from=builder /home/node/app/public ./public

# libsql packages
COPY --from=builder /home/node/app/node_modules/.pnpm/libsql@0.4.6/node_modules/@libsql ./node_modules/.pnpm/libsql@0.4.6/node_modules/@libsql
COPY --from=builder /home/node/app/node_modules/@libsql ./node_modules/@libsql
COPY --from=builder /home/node/app/node_modules/.pnpm/@libsql+client@0.6.2 ./node_modules/.pnpm/@libsql+client@0.6.2
COPY --from=builder /home/node/app/node_modules/.pnpm/@libsql+client@0.14.0 ./node_modules/.pnpm/@libsql+client@0.14.0
COPY --from=builder /home/node/app/node_modules/.pnpm/@libsql+core@0.6.2 ./node_modules/.pnpm/@libsql+core@0.6.2
COPY --from=builder /home/node/app/node_modules/.pnpm/@libsql+core@0.14.0 ./node_modules/.pnpm/@libsql+core@0.14.0
COPY --from=builder /home/node/app/node_modules/.pnpm/@libsql+hrana-client@0.6.2 ./node_modules/.pnpm/@libsql+hrana-client@0.6.2
COPY --from=builder /home/node/app/node_modules/.pnpm/@libsql+hrana-client@0.7.0 ./node_modules/.pnpm/@libsql+hrana-client@0.7.0
COPY --from=builder /home/node/app/node_modules/.pnpm/@libsql+isomorphic-fetch@0.2.5 ./node_modules/.pnpm/@libsql+isomorphic-fetch@0.2.5
COPY --from=builder /home/node/app/node_modules/.pnpm/@libsql+isomorphic-fetch@0.3.1 ./node_modules/.pnpm/@libsql+isomorphic-fetch@0.3.1
COPY --from=builder /home/node/app/node_modules/.pnpm/@libsql+isomorphic-ws@0.1.5 ./node_modules/.pnpm/@libsql+isomorphic-ws@0.1.5
COPY --from=builder /home/node/app/node_modules/.pnpm/@libsql+linux-arm64-musl@0.4.6 ./node_modules/.pnpm/@libsql+linux-arm64-musl@0.4.6

COPY --from=builder /home/node/app/payload.sqlite ./payload.sqlite

ENV HOSTNAME=0.0.0.0

CMD ["node", "server.js"]