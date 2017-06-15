# docker-cdist

![logo](logo.png)

Container suitable for running cdist.

# What is it?

This container is suitable for configuring hosts via cdist.


# How to use it?

* You should have an ssh running to forward your credentials into the
container.

* To allow access to your configuration, pass the correct volume into
the container


``` bash
docker run -rm -ti \
       -v $(dirname $SSH_AUTH_SOCK) -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK \
       -v /path/to/.cdist:/root/.cdist ungleich/cdist /bin/bash
```

And inside the container you can use the usual cdist commands:

``` bash
cdist config -vv <hostname>
```
