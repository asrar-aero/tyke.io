FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y curl nginx vim dos2unix
RUN pwd
WORKDIR /etc/ssl
RUN apt-get update \
    && apt-get install libssl-dev -y
COPY default.conf /etc/nginx/conf.d/ 
COPY gen-certificate.sh /etc/ssl/
RUN chmod +x gen-certificate.sh
COPY sample.html /usr/share/nginx/html/index.html
RUN pwd
RUN ls -lrth /etc/ssl
RUN dos2unix gen-certificate.sh
RUN ./gen-certificate.sh localhost
RUN ls -lrth /etc/ssl
EXPOSE 80/tcp 443/tcp

ENTRYPOINT ["/usr/sbin/nginx"]
CMD ["-g","daemon off;lock_file /run/lock/nginx.lock;"]
