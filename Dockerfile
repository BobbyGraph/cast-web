FROM node:alpine
RUN npm install google-assistant -g ---unsafe-perm
RUN npm install cast-web-api -g --unsafe-perm
EXPOSE 3000
CMD ["cast-web-api"]
