FROM node:10-alpine

RUN mkdir -p /cwk2/node_modules && chown -R node:node /cwk2

WORKDIR /cwk2

COPY package*.json ./

USER node

RUN npm install

COPY --chown=node:node . .

EXPOSE 80

CMD [ "node", "app.js" ]
