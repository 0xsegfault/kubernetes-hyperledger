FROM nginx

RUN apt update -y
RUN apt install emacs curl git -y

WORKDIR /app

COPY ./setup.sh ./setup.sh