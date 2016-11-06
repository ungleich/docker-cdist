FROM ubuntu
MAINTAINER ungleich <team at ungleich.ch>

ENV branch=beta
ENV repo=https://github.com/ungleich/cdist.git 

WORKDIR /root
RUN apt-get update -y && \
        apt-get install --no-install-recommends -y \
            git \
            ca-certificates \
            python3 \
            lsb-core && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/* && \
        git clone -b $branch $repo

RUN echo 'PATH=$PATH:/root/cdist/bin' >> .bashrc
