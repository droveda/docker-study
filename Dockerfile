FROM node:latest
LABEL key="DRoveda"
ENV MY_ENV=development
COPY ./volume-exemplo/. /var/www
WORKDIR /var/www
RUN npm install
ENTRYPOINT [ "npm", "start" ]
EXPOSE 3000

