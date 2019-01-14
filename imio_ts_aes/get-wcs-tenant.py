#!/usr/bin/env python
import os
import pickle
import quixote
from wcs.qommon.publisher import get_publisher_class

Publisher = get_publisher_class()
quixote.cleanup()
pub = Publisher.create_publisher()
base_app_dir = pub.app_dir
for hostname in Publisher.get_tenants():
    tenant_path = os.path.join(base_app_dir, hostname)
    config = os.path.join(tenant_path, 'config.pck')
    if not os.path.exists(config):
        continue
    else:
        content = pickle.load(open(config, "rb"))
        if content.get('sp') is None or content.get('sp').get('saml2_base_url') is None:
            continue
    print(hostname)

