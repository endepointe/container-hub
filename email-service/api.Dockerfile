FROM alpine:3.20
RUN apk upgrade \
	&& apk update \
	&& apk add bind-tools

