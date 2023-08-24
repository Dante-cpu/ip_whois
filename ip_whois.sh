#!/bin/bash

ip_file="ip_adresses.txt"

while IFS=read -r ip_address; do
  whois_result=$(whois "$ip_address")
  org=$(echo "$whois_result" | grep -E '^org:' | awk -F ': ' '{print $2}')
  echo "$org" >>org.txt
done < "$ip_file"
