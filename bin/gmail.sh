#!/bin/bash

gmail_login="gavinwahl"
gmail_password=`cat ~/.gmail_password`

dane="$(wget --secure-protocol=TLSv1 --timeout=3 -t 1 -q -O - \
https://${gmail_login}:${gmail_password}@mail.google.com/mail/feed/atom \
--no-check-certificate | grep 'fullcount' \
| sed -e 's/.*<fullcount>//;s/<\/fullcount>.*//' 2>/dev/null)"

if [ -z "$dane" ] || [ "$dane" -eq "0" ] ; then
echo ""
else
echo " | Gmail: $dane"
fi
