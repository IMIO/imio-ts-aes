#/bin/sh

set -e
USER="wcs"

# installation path
install_path="/usr/lib/imio_ts_aes"

# WCS : Get wcs tenant
wcs_tenant=$(python $install_path/get-wcs-tenant.py 2>&1)
IFS='.' read -ra my_array <<< $wcs_tenant
domain="${my_array[1]}".be
commune=$(echo "$wcs_tenant" | sed "s/-formulaires.$domain//")

# COMBO : Get combo tenant
combo_tenant=$(echo "$wcs_tenant" | sed "s/-formulaires//")

# echo $combo_tenant

# COMBO : import AES widget (settings.json)
sed -i "s/[COMMUNE]/$commune/g" $install_path/combo/tenants/settings.json
sed -i "s/[DOMAIN]/$domain/g" $install_path/combo/tenants/settings.json
cp $install_path/combo/tenants/settings.json /var/lib/combo/tenants/$combo_tenant/
sed -i "s/$commune/[COMMUNE]/g" $install_path/combo/tenants/settings.json
sed -i "s/$domain/[DOMAIN]/g" $install_path/combo/tenants/settings.json

service combo restart
