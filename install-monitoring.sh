#!/bin/bash

#What this script will do:
#fix the "sudo: unable to resolve host ip-10-43-116-xxx" message on command-line
#without this fix some sensu-checks written as a shell-script will fail
#export an environment variable HOST_ADDR
#install ruby-dev
#install sensu
#install sensu-checks
#configure sensu-client using the hostname and HOST_ADDR
#set autostart for sensu-client
#start sensu-client

echo "127.0.0.1 $(hostname)" > hosts.new
cat /etc/hosts >> hosts.new
sudo mv hosts.new /etc/hosts
export HOST_ADDR=$(ifconfig eth0 | awk -F':' '/inet addr/&&!/127.0.0.1/{split($2,_," ");print _[1]}')
wget -q http://repos.sensuapp.org/apt/pubkey.gpg -O- | sudo apt-key add -
sudo echo "deb http://repos.sensuapp.org/apt sensu main" | sudo tee /etc/apt/sources.list.d/sensu.list
sudo apt-get update
sudo apt-get -y install ruby-dev
sudo apt-get install make
sudo apt-get install sensu
sudo mkdir -p /etc/sensu/ssl
sudo gem install sensu-plugin
sudo gem install sensu-plugins-disk-checks
sudo gem install sensu-plugins-cpu-checks
sudo gem install sensu-plugins-process-checks
sudo gem install sensu-plugins-network-checks
sudo gem install sensu-plugins-load-checks


echo "-----BEGIN CERTIFICATE-----
MIIC4zCCAcugAwIBAgIBAjANBgkqhkiG9w0BAQUFADARMQ8wDQYDVQQDEwZUZXN0
Q0EwHhcNMTUwODIwMTAzMzExWhcNMTYwODE5MTAzMzExWjAoMRUwEwYDVQQDDAw3
NWY5MmI3OGQyY2MxDzANBgNVBAoMBmNsaWVudDCCASIwDQYJKoZIhvcNAQEBBQAD
ggEPADCCAQoCggEBAKoMrw4ryWLRGdD4mn7wZv4wgW2Ymn23/52+iGYUpyWhG3Xu
IF6159QWodNY5fXnUcjuy57YWvGav779lTI8Rvx6tAinybcvXlFnpEvkUwWoN/QW
1FKHyjxWCCD8X+4IGf0LJbkxveW6g/NCzP2uHQwuFCOHLM0EU0aldbZSYovPBcnD
QtJ5uxgaqC6SIkwAPmm3tatv4D1RJXlx5Z2xCNth/34sqBCHAzPu+t08HAyluO2d
BzijuhjosrAAgcaBbIpVOXDXS8dzS35b50/xprD3ct0nOrBR1s44QrWQ6813L97x
XHUcqy8U3smYKn1shOXfGUMdRAoB7v/HLWaqmukCAwEAAaMvMC0wCQYDVR0TBAIw
ADALBgNVHQ8EBAMCB4AwEwYDVR0lBAwwCgYIKwYBBQUHAwIwDQYJKoZIhvcNAQEF
BQADggEBALJuerdwkfhaYtM9q+BC1PSQdlNcr6D5gkzVa0yKB+7FP7y9Z4G6wAQc
mLRhlD/GHePAoDjqwaCwC/81aKeEezPpMMD/61RveZ8tkISDVsZHmxc7K0wxwuSv
qBhga2u2io52zEBTrCPu4jVojoXe/Ir5CI2pWV1UtzTY1bgh1/PJ+Qvu420YvBa8
j1byFmMbZCyNIExd5GAniS0yWkvL+sfFyqd4Clvis0Wqa6l7RI+FJJJV4GT1c5Gn
OD89bNc5YmbST7TMjL2WP6EInLqotqdW8xu0pLWO6hyDgda41i5SypkzkdDy8qsC
MBXjIJHafIchvoveppPMWaZvdb5RF7o=
-----END CERTIFICATE-----" | sudo tee /etc/sensu/ssl/cert.pem

echo "-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAqgyvDivJYtEZ0PiafvBm/jCBbZiafbf/nb6IZhSnJaEbde4g
XrXn1Bah01jl9edRyO7Lntha8Zq/vv2VMjxG/Hq0CKfJty9eUWekS+RTBag39BbU
UofKPFYIIPxf7ggZ/QsluTG95bqD80LM/a4dDC4UI4cszQRTRqV1tlJii88FycNC
0nm7GBqoLpIiTAA+abe1q2/gPVEleXHlnbEI22H/fiyoEIcDM+763TwcDKW47Z0H
OKO6GOiysACBxoFsilU5cNdLx3NLflvnT/GmsPdy3Sc6sFHWzjhCtZDrzXcv3vFc
dRyrLxTeyZgqfWyE5d8ZQx1ECgHu/8ctZqqa6QIDAQABAoIBAHWLqv5Kujy6efP/
xRv2JduTwAP4NuKsa9+oszSNFjVmtkrAvlN5vrTWqComC1/99ITGvK4itErKQ71M
IPPGwvMIBqbtBPzBm5r9344uWE1SyMrLdR1PjDZE6f2TNuSdaQmHyR3JCpFgapGf
HYBF+QJQX89nQ0q8sKvm+AV90Wz+Hp4iEJZa1DR3hFP5uOi4Rus2SzUr/+zKiges
8JjphXgIEjahUmjL/EjvZ/upOnOl2yD7aUooNEa2qG+dg+cvYpdkgCaZ85pSK04b
qfwOY0fgebgz3LFOs1wVRU4A2o5TCTtD9LiqEquXZSyujazejeHgOtmU+KK3oXrX
5unDJ7kCgYEA4U5pSNbqN2iaUX5VyT1HLUqj1QpAY2LDa7x89Xxi3gC010et88cw
k0FwxQmGSERsZm4Z6tw1vXonD6RkA1F4OmrWu32WwhmKRzdsC/1F6oHhvTrgED25
sWAPsqMvY/THWkR7vKn/oXmceXrQbA6wX8Be7l8HM9ZdBEgXFoD5UJ8CgYEAwTcv
iJ83QSTOPQNoBlvaFPSksrC4BSaIqz9xgZ7kRwhODMpZcnxoqUPyoFGsuoRxyyn/
qvW+QCqlei/1Zc2/sHaAYcp2ffgQP3Dt71Q0ry9p97lHn8cUZVaaBrwfrrUFMGa/
FjkK9Wa075M57N04p3pX9mUCIB3aQseMRmaxP3cCgYB+37HoI6YHB6+G3paeWRSA
y7xQVpKFpPMY8y6G6sGd9FXhuOqbEXsoITzIqCFnBqjoUW3k1JaqmWPvqgnr2G/U
rZ84O3Ou38T/b5U3dyts8DDXZ5UPcELmQIr2dHBWYFv2WAQ57J0YKCxWODOv9eGa
OfD7WKXsqfT9WT8vG/fJTwKBgEhAVbMWLrhahhDExFKUaHGrpib39Ghgp3y6Jbzd
6OkzDtSzmk04fn7FXOZchGXe/xqE4wlQCcu+5tBRPMfL76GSPqHS7wpeB91hYmg7
qdPUvCCZlVIHRPY8My7PjF1tbbpSwaQSwqlPtdtcx61ucDAYjOojjW7rGuIb8rWk
0yUzAoGBAKh7vYQtYOgfYxLi5v4VsJwTr4vreo04176hghewn3WBVXREY/8JaZ/N
VFtIp3MCnCn0pcYLUL9Nc1UnxKP1i10JDPuDiTL5Qowb9TN/GPEja9CicoEeeYpS
0dhAZIA4syC+MMVIfiOvDHneF60tBxSnAtceHx/WkY490AXSAs2I
-----END RSA PRIVATE KEY-----" | sudo tee /etc/sensu/ssl/key.pem

echo "{
  \"rabbitmq\": {
    \"ssl\": {
      \"cert_chain_file\": \"/etc/sensu/ssl/cert.pem\",
      \"private_key_file\": \"/etc/sensu/ssl/key.pem\"
    },
    \"host\": \"10.43.116.156\",
    \"port\": 5671,
    \"vhost\": \"/sensu\",
    \"user\": \"sensu\",
    \"password\": \"password\"
  }
}" | sudo tee /etc/sensu/conf.d/rabbitmq.json

echo "{
  \"client\": {
    \"name\": \"$(hostname)\",
    \"address\": \"$HOST_ADDR\",
    \"subscriptions\": [
      \"common\"
    ]
  },
  \"keepalive\": {
    \"thresholds\": {
      \"critical\": 60
    },
    \"refresh\": 300
  }
}" | sudo tee /etc/sensu/conf.d/client.json

#/etc/init.d/sensu-client start
sudo service sensu-client start

sudo update-rc.d sensu-client defaults

exec "$@"
