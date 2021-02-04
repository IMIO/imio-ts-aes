#!/bin/sh

#$1 = domain (guichet-citoyen.be,...)

set -e
USER="wcs"

domain=$1

echo "--- installation path"
install_path="/usr/lib/imio_ts_aes"

echo "--- WCS : Get wcs tenant"
wcs_tenant=$(python3 $install_path/get-wcs-tenant.py 2>&1)
commune=$(echo "$wcs_tenant" | sed "s/-formulaires.$domain//")

echo "--- COMBO : Get combo tenant"
combo_tenant=$(echo "$wcs_tenant" | sed "s/-formulaires//")

if ! [ -d /var/lib/wcs/$wcs_tenant/wscalls/ ]
then
    mkdir /var/lib/wcs/$wcs_tenant/wscalls
fi
cp $install_path/wscalls/* /var/lib/wcs/$wcs_tenant/wscalls

echo "--- WCS : Create categories (Categories must be create before forms, category can't be an alphanumeric name...)"
if [ -z `grep accueil-extra-scolaire /var/lib/wcs/*/categories -nri` ]; then
    echo 'install category'
    category_registration_number=$(ls /var/lib/wcs/$wcs_tenant/categories |  sort -n | tail -1)
    sed -i 's/id="0"/id="'$(($category_registration_number + 1))'"/g' $install_path/category/0
    cp $install_path/category/0 /var/lib/wcs/$wcs_tenant/categories/$(($category_registration_number + 1))
    sed -i 's/id="'$(($category_registration_number + 1))'"/id="0"/g' $install_path/category/0
    chown -R ${USER}:${USER} /var/lib/wcs/$wcs_tenant/categories/$(($category_registration_number + 1))
else
    echo 'category already exist'
fi

echo "--- Set passerelle config"
if [ -f "/etc/passerelle/settings.d/aes.py" ]
then
  cp $install_path/passerelle/aes.py /etc/passerelle/settings.d/
  service passerelle restart
fi

echo "--- Deploy passerelle plugins."
sudo -u passerelle /usr/bin/passerelle-manage tenant_command import_site -d $commune-passerelle.$domain $install_path/passerelle/iimioiaaes.json

echo "--- Deploy datasources"
echo 'Get AES datasources'
datasources=$(ls datasources/)
echo 'Start install'
for datasource in $datasources
do
  echo 'Get datasource slug'
  datasource_slug=$(grep "<slug>.*</slug>" datasources/$datasource | sed 's#<slug>##g' | sed 's#</slug>##g')
  echo '  Is' $datasource_slug installed' yet ?'
  if [ -z "`grep -rim 1 $datasource_slug /var/lib/wcs/$wcs_tenant/datasources/`" ]; then
    echo '    Installing datasource n°'$datasource $datasource_slug
    datasource_registration_number=$(ls /var/lib/wcs/$wcs_tenant/datasources |  sort -n | tail -1)
    sed -i 's/id="'$datasource'"/id="'$(($datasource_registration_number + 1))'"/g' $install_path/datasources/$datasource
    cp $install_path/datasources/$datasource /var/lib/wcs/$wcs_tenant/datasources/$(($datasource_registration_number + 1))
    sed -i 's/id="'$(($datasource_registration_number + 1))'"/id="'$datasource'"/g' $install_path/datasources/$datasource
    chown -R ${USER}:${USER} /var/lib/wcs/$wcs_tenant/datasources/$(($datasource_registration_number + 1))
  else
    echo '    ' $datasource_slug' already installed'
  fi
done

chown -R ${USER}:${USER} /var/lib/wcs/$wcs_tenant/wscalls/aes*
# chown -R ${USER}:${USER} $install_path/datasources

echo "--- Create roles"
authentic2-multitenant-manage tenant_command runscript create-roles.py -d $commune-auth.$domain

echo "--- WCS : Script to import xml workflow in wcs (Workflows must be create before forms)"
sudo -u  wcs wcsctl -f /etc/wcs/wcs-au-quotidien.cfg runscript --vhost=$wcs_tenant $install_path/import-workflows.py $install_path

echo "---  WCS : Script to import xml forms in wcs"
sed -i -E 's|category_id=.*>(.*)</category>|category_id="'$(($category_registration_number + 1))'">\1</category>|' $install_path/forms/*.wcs
sudo -u  wcs wcsctl -f /etc/wcs/wcs-au-quotidien.cfg runscript --vhost=$wcs_tenant $install_path/import-forms.py $install_path

echo "---  COMBO : import AES widget (settings.json)"
sed -i "s/\[COMMUNE\]/$commune/g" $install_path/combo/tenants/settings.json
sed -i "s/\[DOMAIN\]/$domain/g" $install_path/combo/tenants/settings.json
cp $install_path/combo/tenants/settings.json /var/lib/combo/tenants/$combo_tenant/
sed -i "s/$commune/\[COMMUNE\]/g" $install_path/combo/tenants/settings.json
sed -i "s/$domain/\[DOMAIN\]/g" $install_path/combo/tenants/settings.json

echo "--- COMBO : import AES portail-citoyen structure"
sudo -u combo combo-manage tenant_command import_site -d $combo_tenant $install_path/combo/portail-citoyen-aes.json
sudo -u combo combo-manage tenant_command import_site -d $combo_tenant $install_path/combo/portail-agent-aes.json
