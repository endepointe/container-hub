FROM alpine:3.20 
RUN apk update && apk upgrade && apk add postfix

