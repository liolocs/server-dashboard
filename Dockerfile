FROM node:18-alpine AS base

FROM base AS deps
WORKDIR /home/node/app
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

FROM base AS builder
WORKDIR /home/node/app
COPY --from=deps /home/node/app/node_modules ./node_modules
COPY . .
# RUN yarn build

# FROM base AS runner
# WORKDIR /home/node/app
# ENV NODE_ENV production
# COPY --from=builder /home/node/app/dist ./dist
# COPY --from=builder /home/node/app/package.json ./package.json
# RUN yarn install --production

EXPOSE 3000
# CMD ["node", "dist/server.js"]
