JSON_CELL_TYPES.update(
    {
        "portail_parent": {
            "name": "Portail Parent - Page d'accueil",
            "url": "{{ passerelle_url }}passerelle-imio-ia-aes/aes/parents/{{ request.session.mellon_session.aes_id.0 }}/homepage/",
        },
    }
)
