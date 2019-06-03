FROM buildpack-deps:stretch-curl

RUN apt-get update && apt-get install wget &&  wget http://nginx.org/keys/nginx_signing.key && apt-key add nginx_signing.key
RUN echo 'deb http://nginx.org/packages/mainline/debian/ stretch nginx' >> /etc/apt/sources.list
RUN apt-get update && \
    apt-get install -y nginx-nr-agent && \
    rm -rf /var/lib/apt/lists/*

COPY configure.sh .

RUN ln -sf /dev/stdout /var/log/nginx-nr-agent.log

CMD bash configure.sh && \
    script -qfc '/usr/bin/nginx-nr-agent.py -c /etc/nginx-nr-agent/nginx-nr-agent.ini -f start';
