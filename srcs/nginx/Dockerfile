# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cbach <cbach@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/11 13:34:08 by cbach             #+#    #+#              #
#    Updated: 2020/12/11 13:34:35 by cbach            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

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
