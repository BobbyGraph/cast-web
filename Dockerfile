/*FROM node:9.3-stretch

RUN apt-get update; \
    apt-get install -y git make; \
    apt-get install -y npm; \
    apt-get install -y libavahi-compat-libdnssd-dev

RUN npm cache clean -f; \
    npm install -g n; \
    n stable; \
    node -v
    
WORKDIR castAPI
RUN npm install cast-web-api
WORKDIR node_modules
WORKDIR cast-web-api
RUN npm install castv2-client

RUN npm install -g npm-check-updates
RUN ncu --upgradeAll
RUN npm install

CMD ["node","castWebApi.js","--hostname=192.168.1.100"]*/

FROM node:alpine
WORKDIR /cast-web-api
RUN apk add --update git && \
  rm -rf /tmp/* /var/cache/apk/*
RUN git clone https://github.com/vervallsweg/cast-web-api.git . && \
  npm install 
EXPOSE 3000
CMD ["node","/cast-web-api/castWebApi.js","--hostname=192.168.1.100","--port=3000","--net=host"]
