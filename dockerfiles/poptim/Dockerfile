FROM debian:buster-slim

WORKDIR /src
RUN apt-get update && apt-get -y install wget gcc libsqlite3-dev zlib1g-dev libexpat1-dev libssl-dev xz-utils dpkg-dev binutils libbz2-dev libreadline-dev libffi-dev make

RUN wget https://www.python.org/ftp/python/3.8.3/Python-3.8.3.tar.xz
RUN tar xvf Python-3.8.3.tar.xz
WORKDIR Python-3.8.3

RUN sed -i -e "s|-flto |-flto=4 |g" configure configure.ac
COPY _configure.sh ./
RUN sh _configure.sh
COPY _make.sh ./
RUN sh _make.sh

COPY _make_install.sh ./
RUN sh _make_install.sh

RUN /opt/custpyt/bin/pip3 install pyperformance
