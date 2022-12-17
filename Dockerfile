FROM ubuntu:bionic

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt install -y texlive-latex-extra texlive-fonts-extra

WORKDIR /data

VOLUME ["/data"]