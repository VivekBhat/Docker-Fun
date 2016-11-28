
FROM ubuntu:15.04
MAINTAINER Vivek Bhat, vbhat@ncsu.edu

RUN apt-get -y update

# update packages and install
RUN apt-get install -y wget openjdk-8-jdk curl unzip

RUN apt-get -y install git
RUN apt-get -y install maven
RUN apt-get -y install libblas*
RUN ldconfig /usr/local/cuda/lib64

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

