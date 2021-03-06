FROM ubuntu

RUN echo 'deb http://archive.ubuntu.com/ubuntu trusty main universe restricted' > /etc/apt/sources.list
RUN echo 'deb http://archive.ubuntu.com/ubuntu trusty-updates main universe restricted' >> /etc/apt/sources.list
#RUN echo 'deb http://ppa.launchpad.net/ubuntu-wine/ppa/ubuntu trusty main' >> /etc/apt/sources.list
#RUN echo 'deb-src http://ppa.launchpad.net/ubuntu-wine/ppa/ubuntu trusty main' >> /etc/apt/sources.list

RUN dpkg --add-architecture i386

RUN apt-key update
RUN apt-get update
RUN apt-get install -qy \
software-properties-common \
build-essential \
pkg-config

RUN add-apt-repository ppa:ubuntu-wine/ppa

RUN apt-get update
RUN apt-get install -qy \
wine1.7 \
winetricks \
xvfb

#RUN apt-get install -y software-properties-common && add-apt-repository -y ppa:ubuntu-wine/ppa
#RUN apt-get update -y

RUN apt-get purge -y software-properties-common
RUN apt-get autoclean -y
