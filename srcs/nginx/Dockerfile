FROM alpine:linux

LABEL maintainer = "cbach"

WORKDIR /dir/

RUN apk -U upgrade

RUN apk add --no-cache -y   nginx \
                            openssh \
                            openssl \
                            supervisor \
                            sudo

COPY ./srcs/ .

EXPOSE 80 443

CMD bash boot.sh