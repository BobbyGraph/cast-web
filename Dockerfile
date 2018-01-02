FROM debian:stretch

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install git make
RUN apt-get install npm
RUN apt-get install libavahi-compat-libdnssd-dev
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

#WORKDIR /castAPI
EXPOSE 3000
