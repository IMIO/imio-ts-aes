#!/bin/sh
for i in /var/lib/wcs/*/ ; do ln -s /usr/share/imio-ts-aes/wscalls $i/wscalls; done
