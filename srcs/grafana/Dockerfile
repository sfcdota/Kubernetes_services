FROM alpine

LABEL maintainer = "cbach"

WORKDIR /dir/

RUN apk -U upgrade

RUN apk add --no-cache 


EXPOSE 80 443

CMD bash boot.sh