FROM node:scratch
WORKDIR /castAPI
EXPOSE 3000

RUN sudo apt-get install git make
RUN sudo apt-get install npm
RUN sudo apt-get install libavahi-compat-libdnssd-dev
RUN sudo npm cache clean -f
RUN sudo npm install -g n
RUN sudo n stable

RUN sudo mkdir castAPI
RUN sudo cd castAPI
RUN sudo npm install cast-web-api
RUN sudo cd node_modules
RUN sudo cd cast-web-api
RUN sudo npm install castv2-client
RUN sudo npm install forever -g
