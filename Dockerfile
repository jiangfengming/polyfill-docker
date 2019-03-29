FROM node

WORKDIR /home/node
ADD --chown=node:node https://github.com/Financial-Times/polyfill-service/archive/v4.8.1.tar.gz polyfill-service-4.8.1.tar.gz
RUN chown node:node polyfill-service-4.8.1.tar.gz
USER node
RUN tar -xzvf polyfill-service-4.8.1.tar.gz
RUN rm polyfill-service-4.8.1.tar.gz

WORKDIR /home/node/polyfill-service-4.8.1
RUN npm install
RUN npm run build
ENV NODE_ENV=production
ENTRYPOINT ["npm", "run", "start"]
EXPOSE 8080
