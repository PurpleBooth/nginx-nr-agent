FROM buildpack-deps:jessie-curl

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62
RUN echo 'deb http://nginx.org/packages/mainline/debian/ jessie nginx' >> /etc/apt/sources.list
RUN apt-get update && \
    apt-get install -y nginx-nr-agent && \
    rm -rf /var/lib/apt/lists/*

COPY configure.sh .

RUN ln -sf /dev/stdout /var/log/nginx-nr-agent.log

CMD bash configure.sh && \
    script -qfc '/usr/bin/nginx-nr-agent.py -c /etc/nginx-nr-agent/nginx-nr-agent.ini -f start';