#!/bin/sh

#$1 = domain (guichet-citoyen.be,...)

set -e
USER="wcs"

domain=$1

# installation path
install_path="/usr/lib/imio_ts_aes"

# WCS : Get wcs tenant
wcs_tenant=$(python $install_path/get-wcs-tenant.py 2>&1)
commune=$(echo "$wcs_tenant" | sed "s/-formulaires.$domain//")

# COMBO : Get combo tenant
combo_tenant=$(echo "$wcs_tenant" | sed "s/-formulaires//")

if ! [ -d /var/lib/wcs/$wcs_tenant/wscalls/ ]
then
    mkdir /var/lib/wcs/$wcs_tenant/wscalls
fi
cp $install_path/wscalls/* /var/lib/wcs/$wcs_tenant/wscalls

catgrep=`grep accueil-extra-scolaire /var/lib/wcs/*/categories -nri`
if [ -z "$catgrep" ]; then
# WCS : Create categories (Categories must be create before forms, category can't be an alphanumeric name...)
#mv $install_path/category/0 $install_path/category/$(($category_registration_number + 1))
category_registration_number=$(ls /var/lib/wcs/$wcs_tenant/categories |  sort -n | tail -1)
sed -i 's/id="0"/id="'$(($category_registration_number + 1))'"/g' $install_path/category/0
cp $install_path/category/0 /var/lib/wcs/$wcs_tenant/categories/$(($category_registration_number + 1))
sed -i 's/id="'$(($category_registration_number + 1))'"/id="0"/g' $install_path/category/0
chown -R ${USER}:${USER} /var/lib/wcs/$wcs_tenant/categories/$(($category_registration_number + 1))
fi

# Deploy passerelle plugins.
sudo -u passerelle /usr/bin/passerelle-manage tenant_command import_site -d $commune-passerelle.$domain $install_path/passerelle/iimioiaaes.json

dsgrep=`grep demo_aes_repas /var/lib/wcs/$wcs_tenant/datasources -nri`
if [ -z "$dsgrep" ]; then
datasource_registration_number=$(ls /var/lib/wcs/$wcs_tenant/datasources |  sort -n | tail -1)
sed -i 's/id="0"/id="'$(($datasource_registration_number + 1))'"/g' $install_path/datasources/0
cp $install_path/datasources/0 /var/lib/wcs/$wcs_tenant/datasources/$(($datasource_registration_number + 1))
sed -i 's/id="'$(($datasource_registration_number + 1))'"/id="0"/g' $install_path/datasources/0
chown -R ${USER}:${USER} /var/lib/wcs/$wcs_tenant/datasources/$(($datasource_registration_number + 1))
fi

chown -R ${USER}:${USER} /var/lib/wcs/$wcs_tenant/wscalls/aes* 
# chown -R ${USER}:${USER} $install_path/datasources 

# WCS : Script to import xml workflow in wcs (Workflows must be create before forms)
sudo -u  wcs wcsctl -f /etc/wcs/wcs-au-quotidien.cfg runscript --vhost=$wcs_tenant $install_path/import-workflows.py $install_path

# WCS : Script to import xml forms in wcs
sed -i -E 's|category_id=.*>(.*)</category>|category_id="'$(($category_registration_number + 1))'">\1</category>|' $install_path/forms/*.wcs
sudo -u  wcs wcsctl -f /etc/wcs/wcs-au-quotidien.cfg runscript --vhost=$wcs_tenant $install_path/import-forms.py $install_path

# COMBO : import AES widget (settings.json)
sed -i "s/[COMMUNE]/$commune/g" $install_path/combo/tenants/settings.json
sed -i "s/[DOMAIN]/$domain/g" $install_path/combo/tenants/settings.json
cp $install_path/combo/tenants/settings.json /var/lib/combo/tenants/$combo_tenant/
sed -i "s/$commune/[COMMUNE]/g" $install_path/combo/tenants/settings.json
sed -i "s/$domain/[DOMAIN]/g" $install_path/combo/tenants/settings.json

# COMBO : import AES portail-citoyen structure
sudo -u combo combo-manage tenant_command import_site -d $combo_tenant $install_path/combo/portail-citoyen-aes.json
