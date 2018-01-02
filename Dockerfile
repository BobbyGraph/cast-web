FROM ubuntu:18.04

RUN apt-get -y update && apt-get install -y git make curl npm libavahi-compat-libdnssd-dev

RUN npm cache clean -f
RUN npm install -g n
RUN n stable

RUN mkdir castAPI
#RUN cd castAPI
WORKDIR /castAPI
RUN npm install cast-web-api
#RUN cd node_modules
#RUN cd cast-web-api
WORKDIR /node_modules/cast-web-api
RUN npm install castv2-client
RUN npm install forever -g
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#WORKDIR /castAPI
EXPOSE 3000
CMD forever start castWebApi.js
