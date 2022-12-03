FROM node:16-alpine
LABEL maintainer="chalupa.filip@gmail.com"
COPY content /content
WORKDIR /app
RUN apk add git
RUN git clone https://github.com/podlomar/kodim.cz.git --branch v1.5.12 --depth=1
WORKDIR /app/kodim.cz
COPY server-config.json5 /app/kodim.cz/server-config.json5
RUN npm install -g nodemon
RUN npm ci
RUN npm run build
WORKDIR /app/kodim.cz/dist
RUN git config --global --add safe.directory /content/kurzy/kurz
ENTRYPOINT ["nodemon", "--watch", "/content/kurzy/**/entry.yml", "server.js"]
EXPOSE 3000
