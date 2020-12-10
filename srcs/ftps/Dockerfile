FROM alpine

LABEL maintainer = "cbach"

WORKDIR /dir/

RUN apk -U upgrade

RUN apk add --no-cache vsftpd


EXPOSE 21 21000-21010
VOLUME ftp/ftp

CMD bash boot.sh
