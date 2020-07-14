# imio-ts-aes

Package qui regroupe les différentes briques du portail parent.
Il est constitué de scripts bash qui font appel à des scripts Python pour installer diverses choses dans une instance Publik (formulaires, workflows, sources de données, rôles,...).

C'est en quelque sorte ce qui va "préparer" un e-guichet pour le rendre opérationnel afin que les connexion entre Publik et le produit AES puisse se faire. Il est nécessaire à la mise en place du Portail parent

Installation
------------
   1. `apt update && apt install imio-town-street && apt install wcs-scripts-teleservices`
   2. `cd /usr/lib/imio_town_street`
   3. `./install_imio-town-street.sh DOMAIN (guichet-citoyen.be, lescommunes.be,example.Net,...)`

La catégorie du portail parent
------------------------------
    - Configuration / points d'attentions : 
    Nom = Portail parent
    url = portail-parent
    l'url de la catégorie doit être figé car on s'en sert notemmment pour retrouver les formulaires dans la widget combo.
    L'enregistrement des formulaires lors de l'installation de ce module s'en retrouverait également impacté si le nom de la catégorie change.


La structure du portail parent
------------------------------

Les widgets dédiées au portail parent
-------------------------------------
    - Configuration / points d'attentions : 
    La widget qui affiche les formulaires est basée sur l'identifiant/url de la catégorie (portail-parent). 


Les datasources de base
-----------------------

La création du connecteur passerelle
------------------------------------

Les formulaires
---------------
    - Nomenclature : Les slugs des formulaire commencent par "aes-". 
    - Configuration / points d'attentions :
      Tous les champs des informations personnelles du parent que l'on rappel en début des formulaires doivent être en readonly et on doit inviter le parents à les mettre à jour via son profil. 
      Les champs du parents en début de formulaire ont leur sens car ces champs apparaîtront quand même dans le tableau de traitement de l'agent et lui faciliteront la tâche. 

Les workflows
-------------
    - Nomenclature : Les titres des workflows commencent par "aes -". Les workflows sont triés par titre, ceci permet des les regrouper.
    - Configuration / points d'attentions : 
      Comme l'adresse e-mail des formulaires est un champs de type "commentaire", les WF proposent une donnée de traitement qui enregistre l'adresse e-mail du profil utilisateur dans une donnée de traitement pour l'avoir facilement accessible sur le tableau de traitement.

Les appels aux webservices à partir des formulaires
---------------------------------------------------


Les rôles nécessaires au bon fonctionnement du portail parent
-------------------------------------------------------------
Agents traitants - Portail parent : Autorisation d'utiliser la partie backoffice du portail pour enregister la personne en tant que parent, ses enfants,... à la place du citoyen
Parent : Lorsqu'un agent enregistre une personne via le backoffice, on associe à cette personne le rôle "parent" qui fait office "d'authentification forte". Un utilisateur "parent" est peut donc utiliser les formulaires au même titre qu'un utilisateur authentifié avec sa carte eID.
