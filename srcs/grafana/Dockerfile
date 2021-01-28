# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cbach <cbach@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/11 13:33:32 by cbach             #+#    #+#              #
#    Updated: 2021/01/28 14:10:24 by cbach            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

LABEL maintainer = "cbach"
WORKDIR /dir/

COPY ./srcs/ .

RUN apk -U upgrade && apk add --no-cache wget supervisor && \
	wget https://dl.grafana.com/oss/release/grafana-7.3.7.linux-amd64-musl.tar.gz && \
	tar zxf grafana-7.3.7.linux-amd64-musl.tar.gz && rm grafana-7.3.7.linux-amd64-musl.tar.gz && \
	mv grafana-7.3.7 grafana

EXPOSE 3000

CMD ["/usr/bin/supervisord"]

