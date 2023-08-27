FROM node:18-alpine
LABEL maintainer="chalupa.filip@gmail.com"
COPY content /content
WORKDIR /app
RUN apk add git

# @TODO: use tagged version instead of commit hash
# RUN git clone https://github.com/podlomar/kodim.cz.git --branch v1.5.17 --depth=1
RUN git clone https://github.com/podlomar/kodim.cz.git
WORKDIR /app/kodim.cz
RUN git checkout 69570e04ab260e2b466b7f74daeb070ef5f2597e

WORKDIR /app/kodim.cz/website
RUN echo "CMS_CONTENT_PATH='/content'" > .env.local
RUN npm ci
RUN git config --global --add safe.directory /content/kurzy/kurz
ENTRYPOINT ["npm", "run", "dev"]
EXPOSE 3000
