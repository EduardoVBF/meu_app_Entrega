# Usando uma imagem base do Node.js
FROM node:14

WORKDIR /app

COPY . .

RUN npm install

EXPOSE 8088

CMD ["npm", "start"]
