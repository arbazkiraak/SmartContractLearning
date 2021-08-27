FROM ubuntu:latest

LABEL name="solidity-dev"
LABEL version="latest"


RUN add-apt-repository ppa:ethereum/ethereum
RUN apt update
RUN apt install wget curl gnupg software-properties-common apt-utils -y
RUN apt-get install python3 -y
RUN apt-get install python3-distutils -y
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python3 get-pip.py

RUN apt update
RUN apt install yarn npm git-core libz3-dev -y
RUN apt-get install python3-apt -y
RUN apt-get install python3-dev -y

RUN npm i solc -g
RUN pip3 install solc-select
RUN solc-select install 0.8.2
RUN solc-select use 0.8.2

#RUN solc --version
RUN nodejs --version
RUN yarn --version
RUN npm --version

#RUN npm install truffle -g
#RUN truffle version
