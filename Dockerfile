FROM node:16-alpine
LABEL maintainer="chalupa.filip@gmail.com"
COPY kurzy /kurzy
ENTRYPOINT ["/bin/sh", "-c", "sh"]
EXPOSE 3000
