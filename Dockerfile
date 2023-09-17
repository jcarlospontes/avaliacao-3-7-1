FROM node:alpine as node

WORKDIR /app

COPY projeto-teste/ /app/

RUN npm install

RUN npm run build



FROM httpd:alpine

COPY --from=node /app/projeto-teste/dist/projeto-teste/ /usr/local/apache2/htdocs/

EXPOSE 80

CMD [“apache2ctl”, “-D”, “FOREGROUND”]