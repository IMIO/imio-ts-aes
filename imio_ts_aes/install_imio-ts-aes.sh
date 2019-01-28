#!/bin/sh

# WCS : Create symbolic links where storing wcs webservices calling.
#for i in /var/lib/wcs/*/ ; do ln -s $install_path/wscalls $i/wscalls; done
set -e
USER="wcs"

############### Add dependency passerelle-imio-ia-aes to install aes plugins passerelle.
############### Add passerelle service restart to load plugins
############### Add passerelle connector creation.

# installation path
install_path = "/usr/lib/imio_ts_aes"

# WCS : Get wcs tenant
wcs_tenant=$(python $install_path/get-wcs-tenant.py 2>&1)

commune=$(echo "$wcs_tenant" | sed "s/-formulaires.guichet-citoyen.be//")

# COMBO : Get combo tenant
combo_tenant=$(echo "$wcs_tenant" | sed "s/-formulaires//")

if ! [ -d /var/lib/wcs/$wcs_tenant/wscalls/ ]
then
    mkdir /var/lib/wcs/$wcs_tenant/wscalls
fi
cp $install_path/wscalls/* /var/lib/wcs/$wcs_tenant/wscalls

# WCS : Create categories (Categories must be create before forms)
category_registration_number=$(ls /var/lib/wcs/$wcs_tenant/categories |  sort -n | tail -1)
sed -i 's/id="0"/id="'$(($category_registration_number + 1))'"/g' $install_path/categories/0
mv $install_path/categories/0 $install_path/categories/$(($category_registration_number + 1))
cp $install_path/categories/$(($category_registration_number + 1)) /var/lib/wcs/$wcs_tenant/categories/$(($category_registration_number + 1))

chown -R ${USER}:${USER} /var/lib/wcs/$wcs_tenant/categories/$(($category_registration_number + 1)) 
chown -R ${USER}:${USER} /var/lib/wcs/$wcs_tenant/wscalls/aes* 
# chown -R ${USER}:${USER} $install_path/datasources 

# WCS : Script to import xml workflow in wcs (Workflows must be create before forms)
sudo -u  wcs wcsctl -f /etc/wcs/wcs-au-quotidien.cfg runscript --vhost=$wcs_tenant $install_path/import-workflows.py $install_path

# WCS : Script to import xml forms in wcs
sudo -u  wcs wcsctl -f /etc/wcs/wcs-au-quotidien.cfg runscript --vhost=$wcs_tenant $install_path/import-forms.py $install_path

# COMBO : import AES widget (settings.json)
sed -i "s/[COMMUNE]/$commune/g" $install_path/combo/tenants/settings.json
cp $install_path/combo/tenants/settings.json /var/lib/combo/tenants/$combo_tenant/
sed -i "s/$commune/[COMMUNE]/g" $install_path/combo/tenants/settings.json

# COMBO : import AES portail-citoyen structure
sudo -u combo combo-manage tenant_command import_site -d $combo_tenant $install_path/combo/portail-citoyen-aes.json
