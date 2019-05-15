FROM node:12.2-alpine
WORKDIR /usr/src/app
COPY . .
RUN apk update && apk add git
RUN npm install
RUN npm run-script build