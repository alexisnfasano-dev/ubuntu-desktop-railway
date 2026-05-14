FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV USER=root
ENV PASSWD=password

RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-goodies \
    x11vnc \
    xvfb \
    novnc \
    websockify \
    supervisor \
    wget \
    curl \
    && apt-get clean

RUN echo "root:${PASSWD}" | chpasswd

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 6080

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
