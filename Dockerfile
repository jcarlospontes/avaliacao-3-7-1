#faz o build do projeto angular
FROM node:alpine as node

WORKDIR /app

COPY projeto-teste/ /app/

RUN npm install

RUN npm run build

#executa o apache usando os arquivos do build
FROM httpd:alpine

COPY --from=node /app/dist/projeto-teste/ /usr/local/apache2/htdocs/

EXPOSE 80

CMD ["httpd", "-D", "FOREGROUND"]