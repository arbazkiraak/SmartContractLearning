FROM ubuntu:latest

LABEL name="solidity"
LABEL version="latest"

ENV DEBIAN_FRONTEND noninteractive

RUN apt update
RUN apt install wget curl gnupg software-properties-common apt-utils -y
RUN apt-get install python3 -y
RUN apt-get install python3-distutils -y
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python3 get-pip.py

#RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
#RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN add-apt-repository ppa:ethereum/ethereum

RUN apt update
RUN apt install yarn npm git-core libz3-dev -y
RUN apt-get install python3-apt -y
RUN apt-get install python3-dev -y

RUN npm i solc -g
#RUN pip3 install solc-select
#RUN solc-select install 0.8.2
#RUN solc-select use 0.8.2

RUN wget -O /usr/bin/solc https://github.com/ethereum/solidity/releases/download/v0.4.25/solc-static-linux
RUN chmod +x /usr/bin/solc

RUN solc --version
RUN nodejs --version
RUN yarn --version
RUN npm --version

RUN npm install hardhat -g
RUN npm install truffle -g
RUN npm i ganache-cli -g
RUN pip3 install slither
