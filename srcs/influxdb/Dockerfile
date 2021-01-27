# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cbach <cbach@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/11 13:33:48 by cbach             #+#    #+#              #
#    Updated: 2021/01/27 16:01:37 by cbach            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

LABEL maintainer = "cbach"

COPY ./srcs .
VOLUME /var/lib/influxdb
VOLUME /sys/fs/cgroup
RUN apk update && apk upgrade && apk add --no-cache influxdb openrc wget && openrc default
ADD	https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz /
RUN tar xf /telegraf-1.17.0_linux_amd64.tar.gz && cp -R telegraf-1.17.0/* / && rm -rf telegraf-1.17.0 &&
telegraf -sample-config --input-filter cpu:mem --output-filter influxdb > telegraf.conf
#  && \
# 	service influxdb start && chown -R influxdb:influxdb /var/lib/influxdb


EXPOSE 8086

CMD sh boot.sh
