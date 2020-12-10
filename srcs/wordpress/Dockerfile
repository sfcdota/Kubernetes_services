FROM alpine

LABEL maintainer = "cbach"

WORKDIR /dir/

RUN apk -U upgrade

RUN apk add --no-cache wget -y

COPY ./srcs/ .

EXPOSE 5050

CMD bash boot.sh
