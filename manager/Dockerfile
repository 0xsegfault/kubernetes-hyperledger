FROM nginx

RUN apt update
RUN apt install emacs curl make build-essential

WORKDIR /app

RUN curl -sSL http://bit.ly/2ysbOFE | bash -s 1.3.0

# RUN /app/bin/cryptogen generate --config /app/crypto-config.yaml