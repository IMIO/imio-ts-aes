#!/bin/sh

# WCS : Create symbolic links where storing wcs webservices calling.
for i in /var/lib/wcs/*/ ; do ln -s /usr/share/imio-ts-aes/wscalls $i/wscalls; done
# WCS : Get wcs tenant
wcs_tenant=$(python /usr/share/imio-ts-aes/get-wcs-tenant.py 2>&1)
# WCS : Script to import xml workflow in wcs
sudo -u  wcs wcsctl -f /etc/wcs/wcs-au-quotidien.cfg runscript --vhost=$wcs_tenant /usr/share/imio-ts-aes/import-workflows.py
# WCS : Script to import xml forms in wcs
sudo -u  wcs wcsctl -f /etc/wcs/wcs-au-quotidien.cfg runscript --vhost=$wcs_tenant /usr/share/imio-ts-aes/import-forms.py
