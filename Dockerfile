FROM ubuntu:18.04

RUN apt-get update && apt-get upgrade -y git make curl npm libavahi-compat-libdnssd-dev

RUN npm cache clean -f
RUN npm install -g n
RUN n stable

RUN mkdir castAPI
RUN cd castAPI
RUN npm install cast-web-api
RUN cd node_modules
RUN cd cast-web-api
RUN npm install castv2-client
RUN npm install forever -g
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#WORKDIR /castAPI
EXPOSE 3000
