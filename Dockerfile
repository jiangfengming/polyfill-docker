FROM node:10

RUN apt update
RUN apt install unzip -y
ADD https://github.com/Financial-Times/polyfill-service/archive/master.zip polyfill-service-master.zip
RUN unzip polyfill-service-master.zip
RUN rm polyfill-service-master.zip
WORKDIR /polyfill-service-master
ENV NODE_ENV=production
RUN yarn
RUN yarn run build
ENTRYPOINT ["yarn", "start"]
EXPOSE 8080
