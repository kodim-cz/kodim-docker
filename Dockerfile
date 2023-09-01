FROM node:18-alpine
LABEL maintainer="chalupa.filip@gmail.com"
COPY content /content
WORKDIR /app
RUN apk add git

# @TODO: use tagged version instead of commit hash
# RUN git clone https://github.com/podlomar/kodim.cz.git --branch v1.5.17 --depth=1
RUN git clone --branch 76-verze-20 https://github.com/podlomar/kodim.cz.git
WORKDIR /app/kodim.cz
RUN git checkout c30357622e3e538382bf20f707ae21839bf29aa2

WORKDIR /app/kodim.cz/website
RUN echo "CMS_CONTENT_PATH='/content'" > .env.local
RUN npm ci
RUN npm run build
RUN git config --global --add safe.directory /content/kurzy/kurz
ENTRYPOINT ["npm", "start"]
EXPOSE 3000
