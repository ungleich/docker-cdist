FROM ubuntu
MAINTAINER ungleich <team at ungleich.ch>

ENV branch=master
ENV repo=https://github.com/ungleich/cdist.git

WORKDIR /root
RUN apt-get update -y && \
        apt-get install --no-install-recommends -y \
            git \
            ca-certificates \
            python3 \
            lsb-core \
            openssh-client && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/* && \
        git clone -b $branch $repo

RUN echo 'PATH=$PATH:/root/cdist/bin' >> .bashrc

# Allow automatic runs of cdist
RUN mkdir /root/.ssh
COPY sshconfig /root/.ssh/config
