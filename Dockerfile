FROM node:16-alpine as builder
WORKDIR /home/node/app
COPY --chown=node:node package.json .
RUN npm install
COPY --chown=node:node ./ ./
RUN npm run build

FROM nginx
COPY --chown=node:node --from=builder /home/node/app/build /usr/share/nginx/html