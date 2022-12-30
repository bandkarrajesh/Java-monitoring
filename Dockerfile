FROM ubuntu:latest
ENV prom_ver=2.41.0
ENV graf_ver=9.3.2
RUN apt-get update -y \
&& apt-get upgrade -y \
&& apt-get install wget -y \
&& wget https://github.com/prometheus/prometheus/releases/download/v$(prom_ver)/prometheus-$(prom_ver).linux-amd64.tar.gz \
&& tar zxfv prometheus-$(prom_ver).linux-amd64.tar.gz \
&& rm /prometheus-$(prom_ver).linux-amd64.tar.gz \
&& wget https://dl.grafana.com/oss/release/grafana-$(graf_ver).linux-amd64.tar.gz \
&& tar zxvf grafana-$(graf_ver).linux-amd64.tar.gz \
&& rm /grafana-$(graf_ver).linux-amd64.tar.gz \
&& mv prometheus-$(prom_ver).linux-amd64 prometheus \ 
&& mv grafana-(graf_ver) grafana
COPY start.sh /
COPY start1.sh /
COPY run.sh /
COPY prometheus.yml /prometheus/
EXPOSE 3000
EXPOSE 9090
ENTRYPOINT ["/run.sh"]
