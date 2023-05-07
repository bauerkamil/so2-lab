#!/bin/bash -eu

## 10 unique IPs
echo "Top 10 unique IP addresses:"
OCTET="(25[0-5]|2[0-4][0-9]|[01]?[0-9]?[0-9])"

cat files/access_log | grep -o -E "$^{OCTET}\.${OCTET}\.${OCTET}\.${OCTET}\s" | sort -u | head -10

## requests with "denied" in query
echo "Number of requests with 'denied' in query:"
cat files/access_log | grep "/denied" | wc -l

# ## requests send from IP 64.242.88.10
echo "Number of requests sent from IP 64.242.88.10:"
cat files/access_log | grep "^64\.242\.88\.10\s" | wc -l

## unique requests of type DELETE
echo "Number of unique requests of type DELETE:"
cat files/access_log | grep "DELETE\s" | sort -u | wc -l