FROM node:alpine
WORKDIR /cast-web-api
RUN apk add --update git && \
  rm -rf /tmp/* /var/cache/apk/*
RUN npm install cast-web-api -g
RUN npm install forever -g
EXPOSE 3000
CMD ["forever","start","/cast-web-api/castWebApi.js","--hostname=192.168.1.100","--port=3000","--net=host"]
