#FROM node:20
FROM node:20.18.3-alpine3.21 AS builder
WORKDIR /opt/backend
COPY package.json ./
COPY *.js ./
RUN npm install

FROM node:20.18.3-alpine3.21 
RUN addgroup -S expense && adduser -S expense -G expense && mkdir /opt/backend && chown -R expense:expense /opt/backend
ENV DB_HOST="mysql" 
WORKDIR /opt/backend
COPY --from=builder /opt/backend /opt/backend
USER expense
#ENV DB_HOST="localhost"
CMD ["node","index.js"]