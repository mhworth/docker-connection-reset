#!/bin/bash
dd if=/dev/zero of=/tmp/5kb.dat bs=1024 count=5
dd if=/dev/zero of=/tmp/20mb.dat bs=1024 count=20000
curl --data-binary @/tmp/5kb.dat -X POST 'http://requestb.in/19ayyx61'
curl --data-binary @/tmp/20mb.dat -X POST 'http://requestb.in/19ayyx61'
