FROM ubuntu:22.04

RUN apt-get -y update && \
    apt-get -y install git && \
    apt-get -y install golang && \
    apt-get -y install openjdk-17-jdk openjdk-17-jre openjdk-17-jdk-headless && \
    apt-get -y install unzip zip && \
    apt-get -y install python3 && \
    apt-get -y install wget && \
    apt-get -y install vim && \
    apt-get clean
