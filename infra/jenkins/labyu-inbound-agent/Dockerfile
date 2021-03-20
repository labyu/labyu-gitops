FROM jenkins/inbound-agent:latest-jdk11

## Initial Setting
USER root
RUN apt update -y
RUN apt install -y software-properties-common openssl

## Install Docker
RUN apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

RUN echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt update
RUN apt-get install -y docker-ce docker-ce-cli containerd.io

## Install NodeJs
RUN apt install -y npm
RUN npm install -g n
RUN n stable
RUN npm install -g npm

## Run Jenkins
USER jenkins
ENTRYPOINT ["jenkins-agent"]
