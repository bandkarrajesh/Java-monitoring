FROM ubuntu:latest
RUN apt-get update -y && apt-get upgrade -y && apt-get install wget -y &&\
 wget https://github.com/prometheus/prometheus/releases/download/v2.29.1/prometheus-2.29.1.linux-amd64.tar.gz\
 && tar zxfv prometheus-2.29.1.linux-amd64.tar.gz && rm /prometheus-2.29.1.linux-amd64.tar.gz &&\
 wget https://dl.grafana.com/oss/release/grafana-8.1.1.linux-amd64.tar.gz &&\
 tar zxvf grafana-8.1.1.linux-amd64.tar.gz && rm /grafana-8.1.1.linux-amd64.tar.gz \
 && mv prometheus-2.29.1.linux-amd64 prometheus && mv grafana-8.1.1 grafana
COPY start.sh /
COPY start1.sh /
COPY run.sh /
COPY prometheus.yml /prometheus/
EXPOSE 3000
EXPOSE 9090
ENTRYPOINT ["/run.sh"]