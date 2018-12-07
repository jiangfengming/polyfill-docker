FROM node:10

RUN node -v
RUN yarn global add polyfill-service
ENV NODE_ENV=production
ENTRYPOINT ["polyfill-service"]
EXPOSE 3000
