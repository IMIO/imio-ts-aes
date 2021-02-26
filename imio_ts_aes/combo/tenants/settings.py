JSON_CELL_TYPES.update(
    {
        "wcs-aes-auth": {
            "name": "AES - Formulaires disponibles",
            "url": "{{passerelle_url}}passerelle-imio-ia-aes/aes/is_registered_parent?email={{ user_email }}",
            "additional-data": [
                {
                    "key": "aes_forms",
                    "url": "{{eservices_url}}api/categories/portail-parent/formdefs/",
                },
                {
                    "key": "aes_children",
                    "url": "{{passerelle_url}}passerelle-imio-ia-aes/aes/get_children_by_parent_nrn?email={{ user_email }}&nrn={{ request.session.mellon_session.niss.0 }}",
                },
            ],
        },
        "aes-known-children": {
            "name": "AES - Enfants connus dans votre guichet",
            "url": "{{ passerelle_url }}passerelle-imio-ia-aes/aes/get_children_by_parent_nrn?email={{ user_email }}&nrn={{ request.session.mellon_session.niss.0 }}",
        },
        "aes-plaines": {
            "name": "AES - Semaines de plaines",
            "url": "{{ eservices_url}}api/user/forms?email={{ user_email }}&full=on",
        },
    }
)
