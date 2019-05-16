FROM node:12 as builder
WORKDIR /usr/src/app
COPY package*.json .
RUN npm install
COPY . .
RUN npm run-script build
RUN npm run-script test

FROM nginx:1.15.12-alpine
COPY --from=builder /usr/src/app/public/ /usr/share/nginx/html
RUN ls /usr/share/nginx/html
