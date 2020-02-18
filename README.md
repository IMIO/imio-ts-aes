# imio-ts-aes

Package qui regroupe les différentes briques du portail parent.

La catégorie du portail parent

La structure du portail parent

Les widgets dédiées au portail parent

Les datasources de base

La création du connecteur passerelle

Les formulaires
    - Nomenclature : Les slugs des formulaire commencent par "aes-". 
    - Configuration / points d'attentions :
      Tous les champs des informations personnelles du parent que l'on rappel en début des formulaires doivent être en readonly et on doit inviter le parents à les mettre à jour via son profil. 
      Les champs du parents en début de formulaire ont leur sens car ces champs apparaîtront quand même dans le tableau de traitement de l'agent et lui faciliteront la tâche. 

Les workflows
    - Nomenclature : Les titres des workflows commencent par "aes -". Les workflows sont triés par titre, ceci permet des les regrouper.
    - Configuration / points d'attentions : 
      Comme l'adresse e-mail des formulaires est un champs de type "commentaire", les WF proposent une donnée de traitement qui enregistre l'adresse e-mail du profil utilisateur dans une donnée de traitement pour l'avoir facilement accessible sur le tableau de traitement.

Les appels aux webservices à partir des formulaires



