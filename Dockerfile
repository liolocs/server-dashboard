FROM node:18-alpine as base

FROM base as builder

WORKDIR /home/node/app
COPY package*.json ./
COPY . .
RUN yarn add --frozen-lockfile --ignore-scripts=false --verbose sharp
RUN yarn install
RUN yarn build:prod
RUN yarn payload migrate

FROM base as runtime
ENV NODE_ENV=production
WORKDIR /home/node/app
COPY package*.json  ./
COPY yarn.lock ./
COPY --from=builder /home/node/app/.next ./.next
COPY --from=builder /home/node/app/payload.sqlite ./payload.sqlite
RUN yarn install --production

EXPOSE 3000

CMD ["yarn", "start"]