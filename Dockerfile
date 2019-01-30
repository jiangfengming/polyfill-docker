FROM node:10

RUN node -v
RUN apt update
RUN apt install unzip -y

USER node

WORKDIR /home/node
ADD https://github.com/Financial-Times/polyfill-service/archive/master.zip polyfill-service-master.zip
RUN unzip polyfill-service-master.zip
RUN rm polyfill-service-master.zip

WORKDIR /home/node/polyfill-service-master
ENV NODE_ENV=production
RUN yarn
RUN yarn run build
ENTRYPOINT ["yarn", "run", "start"]
EXPOSE 8080
