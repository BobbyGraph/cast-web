FROM node:alpine
RUN npm install google-assistant -g ---unsafe-perm
RUN npm install cast-web-api -g --unsafe-perm
CMD ["cast-web-api","--hostname=192.168.1.100","--net=host"]
EXPOSE 3000
