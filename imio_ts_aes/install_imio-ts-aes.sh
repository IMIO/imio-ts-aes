#!/bin/sh

set -e

install_path="/usr/lib/imio_ts_aes"

echo "--- Install passerelle settings"
if [ ! -f "/etc/passerelle/settings.d/aes.py" ]
then
  cp $install_path/passerelle/aes.py /etc/passerelle/settings.d/
  service passerelle restart
fi

if [ ! -f "/etc/combo/settings.d/aes.py" ]
then
  cp $install_path/combo/tenants/settings.py /etc/combo/settings.d/aes.py
  service combo restart
fi


sudo -u hobo hobo-manage imio_indus_deploy --directory $install_path
