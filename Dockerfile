FROM node:12 AS builder
WORKDIR /usr/src/app
COPY package*.json .
RUN npm install
COPY . .
RUN npm run-script build
RUN npm run-script test
FROM nginx:1.16-alpine
COPY --from=builder /usr/src/app/public /usr/share/nginx/html
COPY --from=builder /usr/src/app/tests-results /tests-results