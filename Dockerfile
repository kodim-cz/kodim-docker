FROM node:16-alpine
LABEL maintainer="chalupa.filip@gmail.com"
RUN node -v
WORKDIR /app
COPY . .
CMD ["node", "--version"]
EXPOSE 3000
