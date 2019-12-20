#!/bin/bash

hostIPAddress=$(sudo host test.test | sed -n "s/.*IPv4 address //p")
endpoint=$(sudo wg show wg0 endpoints | sed -n "s/^.*\s//p" | sed -n "s/:.*$//p")
PUBLIC_KEY=YQFBWrpLk49iKjhCAPOJkHlPI+iJFbn1XK87Boz+UEI=
ENDPOINT=test.test:51820


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
