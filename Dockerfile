FROM ubuntu:20.04

RUN apt-get -qy update && \
    apt-get -qy install python2.7 python2.7-dev python2.7-doc python-pip-whl python3 python3-dev python3-pip virtualenv virtualenvwrapper && \
    apt-get -qy clean

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qy install git wget curl vim-tiny nano net-tools libssl-dev libgirepository1.0-dev gobject-introspection cairo-5c libcairo-gobject2 libcairo2-dev pkg-config && \
    apt-get -qy install libpq-dev postgresql-client-common postgresql-common && \
    apt-get -qy clean

RUN apt-get -qy install qt5-qmake qtbase5-dev qtbase5-dev-tools libqt5svg5-dev libqt5webenginewidgets5 libqt5webchannel5-dev qtwebengine5-dev

WORKDIR /app

RUN git clone https://github.com/nicehash/nheqminer.git
RUN cd nheqminer
RUN mkdir build && cd build
RUN qmake ../nheqminer/nheqminer.pro
RUN make

CMD ["./nheqminer", "-b"]
