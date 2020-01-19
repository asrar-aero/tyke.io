#!/bin/bash
#Required
domain=$1
commonname=$domain
#Change to your company details

if [ -z "$domain" ]
then
    echo "Argument not present."
    echo "Useage $0 [common name]"
    exit 99
fi

echo "Generating key request for $domain"
echo "generate certificate"
openssl req -x509 -batch -sha256 -nodes -newkey rsa:4096 -keyout $domain.key -out $domain.crt -days 365 \
	-subj "/C=US/ST=Oregon/L=Portland/O=Company Name/OU=Org/CN=localhost"

echo "---------------------------"
echo "-----Below is your Certificate------"
echo "---------------------------"
echo
cat $domain.crt

echo
echo "---------------------------"
echo "-----Below is your Key-----"
echo "---------------------------"
echo
cat $domain.key
