JSON_CELL_TYPES.update(
   {
      "portail_parent": {
         "name": "Portail Parent - Page d'accueil",
         "url": "{{ idp_url }}api/users/{{ user_nameid }}",
         "cache_duration": 0,
         "force_async": True,
         "additional-data": [
            {
               "key": "homepage_data",
               "url": "{% if json.aes_id %}{{ passerelle_url }}passerelle-imio-ia-aes/aes/parents/{{ json.aes_id }}/homepage/{% endif %}"
            }
         ]
      }
   }
)
