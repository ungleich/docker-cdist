FROM ubuntu
MAINTAINER ungleich <team at ungleich.ch>

ENV branch=master

WORKDIR /root
RUN apt-get update -y && \
        apt-get install --no-install-recommends -y git python3 && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/* && \
        git clone -b $branch https://github.com/ungleich/cdist.git 