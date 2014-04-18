#!/bin/bash
dd if=/dev/zero of=/tmp/5kb.dat bs=1024 count=5
dd if=/dev/zero of=/tmp/20mb.dat bs=1024 count=20000
URL='http://requestb.in/19ayyx61'
#URL='http://10.42.42.42:8000' # VM IP address
#URL='10.1.10.24:8000' # Mac IP address
curl --data-binary @/tmp/5kb.dat -X POST $URL
curl --data-binary @/tmp/20mb.dat -X POST $URL
