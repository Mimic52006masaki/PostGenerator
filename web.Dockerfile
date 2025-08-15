FROM node:20

WORKDIR /app

COPY ./web/package.json ./web/package-lock.json ./
RUN npm install

COPY ./web ./

EXPOSE 5173

CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]
