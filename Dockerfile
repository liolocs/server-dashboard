FROM node:18-alpine AS base

FROM base AS builder
WORKDIR /home/node/app
COPY package*.json yarn.lock ./
RUN yarn install
COPY . .
RUN yarn build

FROM base as runtime
ENV NODE_ENV=production
WORKDIR /home/node/app
COPY package*.json ./
COPY yarn.lock ./
RUN yarn install --production
# Copy the built files from the builder stage
COPY --from=builder /home/node/app/dist ./dist
# COPY --from=builder /home/node/app/build ./build

EXPOSE 3000
CMD ["node", "dist/server.js"]
