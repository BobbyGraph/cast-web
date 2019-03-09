FROM node:alpine
WORKDIR /cast-web-api
RUN apk add --update git && \
  rm -rf /tmp/* /var/cache/apk/*
RUN git clone https://github.com/vervallsweg/cast-web-api.git . && \
  npm install
RUN npm install google-assistant -g ---unsafe-perm
EXPOSE 3000
CMD ["node","castWebApi.js","--hostname=192.168.1.100","--port=3000","--net=host"]
