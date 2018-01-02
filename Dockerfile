FROM node:alpine

RUN apk add --update git make curl npm libavahi-compat-libdnssd-dev && \
  rm -rf /tmp/* /var/cache/apk/*

RUN npm cache clean -f && \
  npm install -g n
RUN n stable && \
  node -v

RUN mkdir castAPI
WORKDIR /castAPI
RUN npm install cast-web-api
WORKDIR /castAPI/node_modules/cast-web-api
RUN npm install castv2-client && \
  npm install forever -g
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 3000
VOLUME /castAPI

CMD forever start /castAPI/node_modules/cast-web-api/castWebApi.js --hostname=192.168.1.100
