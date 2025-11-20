JSON_CELL_TYPES.update(
   {
      "pp_activites": {
         "name": "Portail Parent - Activités",
         "url": "{{ idp_url }}api/users/{{ user_nameid }}",
         "cache_duration": 0,
         "additional-data": [
            {
               "key": "formulaires",
               "url": "{{ passerelle_url }}passerelle-imio-ia-aes/aes/get-forms?keywords=inscriptions,désinscriptions"
            },
            {
               "key": "children",
               "url": "{{ passerelle_url }}passerelle-imio-ia-aes/aes/parents/{{ json.aes_id|default:'null' }}/children/"
            },
            {
               "key": "check_invoiceable_disponibility",
               "url": "{{ eservices_url }}api/formdefs/pp-me-designer-facturable/schema"
            },
            {
               "key": "homepage_data",
               "url": "{% if json.aes_id %}{{ passerelle_url }}passerelle-imio-ia-aes/aes/parents/{{ json.aes_id }}/homepage?parent_uuid={{ user_nameid }}{% endif %}"
            }

         ]
      }
   }
)

JSON_CELL_TYPES.update(
   {
      "pp_alimenter_portefeuille": {
         "name": "Portail Parent - Solde portefeuille par catégorie",
         "url": "{{ idp_url }}api/users/{{ user_nameid }}",
         "cache_duration": 0,
         "additional-data": [
            {
               "key": "balances_data",
               "url": "{% if json.aes_id %}{{ passerelle_url }}passerelle-imio-ia-aes/aes/parents/{{ json.aes_id }}/balances{% endif %}"
            }
         ]
      }
   }
)


JSON_CELL_TYPES.update(
   {
      "pp_attestations": {
         "name": "Portail Parent - Attestations",
         "url": "{{ idp_url }}api/users/{{ user_nameid }}",
         "cache_duration": 0,
         "force_async": True,
         "additional-data": [
            {
               "key": "data",
               "url": "{{ passerelle_url }}passerelle-imio-ia-aes/aes/parents/{{ json.aes_id }}/certificates/"
            }
         ]
      }
   }
)

JSON_CELL_TYPES.update(
   {
      "pp_bienvenue_portail_parent": {
         "name": "Portail Parent - Bienvenue sur le Portail Parent",
         "cache_duration": 0,
         "url": "{{ idp_url }}api/users/{{ user_nameid }}"
      }
   }
)
JSON_CELL_TYPES.update(
    {
        "pp_bienvenue_portail_parent_documents": {
            "name": "Portail Parent - Documents à télécharger",
            "cache_duration": 0,
            "url": "w",
            "form": [
                {"varname": "titre", "type": "string", "label": "Titre", "required": False},
                {"varname": "description", "type": "string", "label": "Libellé"},
                {"varname": "doc1_nom", "type": "string", "label": "Nom du document"},
                {"varname": "doc1_url", "type": "string", "label": "URL du document"},
            ]
        }
    }
)

JSON_CELL_TYPES.update(
   {
      "pp_enfants": {
         "name": "Portail Parent - Enfants",
         "url": "{{ idp_url }}api/users/{{ user_nameid }}",
         "cache_duration": 0,
         "force_async": True,
         "additional-data": [
            {
               "key": "homepage_data",
               "url": "{% if json.aes_id %}{{ passerelle_url }}passerelle-imio-ia-aes/aes/parents/{{ json.aes_id }}/homepage?parent_uuid={{ user_nameid }}{% endif %}"
            }
         ]
      }
   }
)

JSON_CELL_TYPES.update(
   {
      "pp_factures": {
         "name": "Portail Parent - Factures",
         "url": "{{ idp_url }}api/users/{{ user_nameid }}",
         "cache_duration": 0,
         "force_async": True,
         "additional-data": [
            {
               "key": "data",
               "url": "{{ passerelle_url }}passerelle-imio-ia-aes/aes/parents/{{ json.aes_id }}/invoices/"
            }
         ]
      }
   }
)

JSON_CELL_TYPES.update(
   {
      "pp_general_factures_attestations": {
         "name": "Portail Parent - Général Factures et Attestations",
         "cache_duration": 0,
         "url": "{{ idp_url }}api/users/{{ user_nameid }}",
      }
   }
)

JSON_CELL_TYPES.update(
   {
      "pp_inscriptions": {
         "name": "Portail Parent - Inscriptions aux plaines et stages",
         "url": "{{ idp_url }}api/users/{{ user_nameid }}",
         "cache_duration": 0,
         "force_async": True,
         "additional-data": [
            {
               "key": "homepage_data",
               "url": "{% if json.aes_id %}{{ passerelle_url }}passerelle-imio-ia-aes/aes/parents/{{ json.aes_id }}/homepage_lite{% endif %}"
            },
            {
                "key": "formulaires",
                "url": "{{ passerelle_url }}passerelle-imio-ia-aes/aes/get-forms?keywords=fiche santé,plaines de vacances"
            },
            {
                "key": "check_invoiceable_disponibility",
                "url": "{{ eservices_url }}api/formdefs/pp-me-designer-facturable/schema"
            }

         ]
      }
   }
)
