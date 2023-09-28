FROM node:18-alpine
LABEL maintainer="chalupa.filip@gmail.com"
COPY content /content
WORKDIR /app
RUN apk add git

RUN git clone https://github.com/podlomar/kodim.cz.git --branch v2.0.0-beta.10 --depth=1

WORKDIR /app/kodim.cz/website
RUN echo "CMS_CONTENT_PATH='/content'" > .env.local
RUN export NODE_ENV=production
RUN npm install -g nodemon
RUN npm ci
# Fails :(
# RUN npm run build
RUN git config --global --add safe.directory /content/kurzy/skupina/kurz
#ENTRYPOINT ["nodemon", "--watch", "/content/kurzy/skupina/**/entry.yml", "--exec", "npm start"]
ENTRYPOINT ["npm", "run", "dev"]
EXPOSE 3000
