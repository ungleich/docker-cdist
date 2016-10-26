FROM ubuntu
MAINTAINER Muneeb Ahmad <beenum>
WORKDIR /root
RUN apt-get update -y && \
	apt-get install -y git python3 python3-pip && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/telmich/cdist.git && \
	cd cdist && export PATH=$PATH:$(pwd -P)/bin && \
	touch cdist/conf/manifest/init && \
	echo '__file /etc/cdist-configured' > cdist/conf/manifest/init && \
	chmod 0700 conf/manifest/init
