FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y upgrade && apt-get install -y apt-utils

RUN apt-get install -y \
	net-tools iputils-ping \
	build-essential git \
	vim nano \
	curl wget 

CMD ["bash"]