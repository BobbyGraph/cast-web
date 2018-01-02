FROM node:alpine
WORKDIR /cast-web-api
RUN apk add --update git && \
    rm -rf /tmp/* /var/cache/apk/*
RUN git clone https://github.com/vervallsweg/cast-web-api.git . && \
    npm install  && \
    npm install castv2-client
EXPOSE 3000
VOLUME /cast-web-api
CMD ["node","/cast-web-api/castWebApi.js","--hostname=192.168.1.100"]
