#!/bin/bash
set -e

iptables -I INPUT -p tcp --dport 80 --syn -j DROP
iptables -I INPUT -p tcp --dport 443 --syn -j DROP

sleep 1
supervisorctl restart haproxy-ddos

iptables -D INPUT -p tcp --dport 80 --syn -j DROP
iptables -D INPUT -p tcp --dport 443 --syn -j DROP
