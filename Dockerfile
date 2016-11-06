FROM ubuntu
MAINTAINER ungleich <team at ungleich.ch>
WORKDIR /root
RUN apt-get update -y && \
        apt-get install -y git python3 python3-pip && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/* && \
        git clone https://github.com/telmich/cdist.git && \
        cd cdist && export PATH=$PATH:$(pwd -P)/bin && \
        echo '__file /etc/cdist-configured' > cdist/conf/manifest/init && \
        chmod 0700 cdist/conf/manifest/init	
