FROM node:alpine
RUN npm install google-assistant -g --unsafe-perm
RUN npm install cast-web-api -g --unsafe-perm
RUN npm install forever -g --unsafe-perm
EXPOSE 3000
CMD ["forever","start","/usr/local/lib/node_modules/cast-web-api/bin/cast-web-api"]
