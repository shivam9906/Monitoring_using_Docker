#!/bin/bash
yum update -y
amazon-linux-extras install docker -y
service docker start
usermod -a -G docker ec2-user

docker run -d -p 9090:9090 prom/prometheus
docker run -d -p 3000:3000 grafana/grafana
docker run -d -p 3100:3100 grafana/loki
