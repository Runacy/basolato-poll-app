FROM nimlang/nim:latest


RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y build-essential wget git nmap curl
RUN nimble install -y https://github.com/itsumura-h/nim-basolato


WORKDIR /root/project/