FROM node:alpine
RUN npm install google-assistant -g ---unsafe-perm
RUN npm install cast-web-api -g --unsafe-perm
EXPOSE 3333
CMD ["cast-web-api","--hostname=192.168.1.100","--port=3000","--net=host"]
