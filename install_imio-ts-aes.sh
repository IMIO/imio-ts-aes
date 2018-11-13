#!/bin/sh

# WCS : Create symbolic links where storing wcs webservices calling.
#for i in /var/lib/wcs/*/ ; do ln -s /usr/share/imio-ts-aes/wscalls $i/wscalls; done
set -e
USER="wcs"

# WCS : Get wcs tenant
wcs_tenant=$(python /usr/share/imio-ts-aes/get-wcs-tenant.py 2>&1)
if ! [ -d /var/lib/wcs/$wcs_tenant/wscalls/ ]
then
    mkdir /var/lib/wcs/$wcs_tenant/wscalls
fi
cp /usr/share/imio-ts-aes/wscalls/* /var/lib/wcs/$wcs_tenant/wscalls

# WCS : Create categories (Categories must be create before forms)
category_registration_number=$(ls /var/lib/wcs/$wcs_tenant/categories |  sort -n | tail -1)
sed -i 's/id="0"/id="'$(($category_registration_number + 1))'"/g' /usr/share/imio-ts-aes/categories/0
mv /usr/share/imio-ts-aes/categories/0 /usr/share/imio-ts-aes/categories/$(($category_registration_number + 1))
cp /usr/share/imio-ts-aes/categories/$(($category_registration_number + 1)) /var/lib/wcs/$wcs_tenant/categories/$(($category_registration_number + 1))

chown -R ${USER}:${USER} /var/lib/wcs/$wcs_tenant/categories/$(($category_registration_number + 1)) 
chown -R ${USER}:${USER} /var/lib/wcs/$wcs_tenant/wscalls/aes* 
# chown -R ${USER}:${USER} /usr/share/imio-ts-aes/datasources 

# WCS : Script to import xml workflow in wcs (Workflows must be create before forms)
sudo -u  wcs wcsctl -f /etc/wcs/wcs-au-quotidien.cfg runscript --vhost=$wcs_tenant /usr/share/imio-ts-aes/import-workflows.py

# WCS : Script to import xml forms in wcs
sudo -u  wcs wcsctl -f /etc/wcs/wcs-au-quotidien.cfg runscript --vhost=$wcs_tenant /usr/share/imio-ts-aes/import-forms.py

# COMBO : import AES portail-citoyen structure
combo_tenant=$wcs_tenant | sed "s/-formulaires//"
sudo -u combo combo-manage tenant_command import_site -d $combo_tenant /usr/share/imio-ts-aes/combo/portail-citoyen-aes.json
