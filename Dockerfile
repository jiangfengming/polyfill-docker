FROM node:10

WORKDIR /home/node
ADD --chown=node:node https://github.com/Financial-Times/polyfill-service/archive/v4.2.0.tar.gz polyfill-service-4.2.0.tar.gz
RUN chown node:node polyfill-service-4.2.0.tar.gz
USER node
RUN tar -xzvf polyfill-service-4.2.0.tar.gz
RUN rm polyfill-service-4.2.0.tar.gz

WORKDIR /home/node/polyfill-service-4.2.0
ENV NODE_ENV=production
RUN yarn
RUN yarn run build
ENTRYPOINT ["yarn", "run", "start"]
EXPOSE 8080
