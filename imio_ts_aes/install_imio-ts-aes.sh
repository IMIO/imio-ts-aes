#!/bin/sh

set -e

install_path="/usr/lib/imio_ts_aes"

echo "--- Install passerelle settings"
if [ ! -f "/etc/passerelle/settings.d/aes.py" ]
then
  cp $install_path/passerelle/aes.py /etc/passerelle/settings.d/
  service passerelle restart
fi

echo "--- Install combo settings for parent portal's custom cells"
ln -s $install_path/combo/tenants/ppv3.py /etc/combo/settings.d/ppv3.py --force 

echo "--- Deploy parent portal"
sudo -u hobo hobo-manage imio_indus_deploy --directory $install_path
