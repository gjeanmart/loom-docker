FROM node:8

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY indexer.js ./

EXPOSE 8081

CMD [ "node", "indexer.js" ]