FROM node:alpine
RUN apk add --update git && \
    rm -rf /tmp/* /var/cache/apk/*
RUN mkdir /cast-web-api
WORKDIR /cast-web-api
RUN npm install cast-web-api
WORKDIR node_modules
WORKDIR cast-web-api
RUN npm install castv2-client
RUN npm install forever -g

EXPOSE 3000
VOLUME /cast-web-api

CMD ["node","/cast-web-api/node_modules/cast-web-api/castWebApi.js","--hostname=192.168.1.100"]
