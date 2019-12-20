#!/bin/bash

hostIPAddress=$(sudo host vpn.kcshome.net | sed -n "s/.*IPv4 address //p")
endpoint=$(sudo wg show wg0 endpoints | sed -n "s/^.*\s//p" | sed -n "s/:.*$//p")
PUBLIC_KEY=yN0O/kS97CjWYIt+moLfS46sHtGMhN00cCinAQd6g2c=
ENDPOINT=vpn.kcshome.net:51820


if [ "$hostIPAddress" == "$endpoint" ]
then
        echo "DNS: $hostIPAddress"
        echo "Endpoint: $endpoint"
else
        echo "DNS: $hostIPAddress"
        echo "Endpoint: $endpoint"
        echo "Rebuilding VPN"
        sudo wg set "wg0" peer "$PUBLIC_KEY" endpoint "$ENDPOINT"
fi
