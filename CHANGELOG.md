Changelog
=========

1.7.5
-----------------
- [MPP-435] Removed: healthsheet self medication data sending to passerelle
- [MPP-435] Changed: prefilling and choices of has medication healthsheet field
- [MPP-434] Fixed: prefilling of disease gravity and treatment healthsheet fields
- [MPP-437] Fixed: display condition on intervention nature healthsheet field

1.7.4
-----------------
- [MPP-431] Added: alert if user leaves not specified fields in healthsheet

1.7.3
-----------------
- [MPP-413] Fixed: manage mandatory and optional authorizations separatly

1.7.2
-----------------
- [MPP-413] Fixed: do not display authorizations fields if there is no authorizations from iA.AES

1.7.1
-----------------
- [MPP-413] Added: management of optional and mandatory authorizations

1.7.0
-----------------
- [MPP-424] Added: comment about additional informations in healthsheet
- [MPP-415] Changed: arnica's label in healthsheet
- [MPP-393] Changed: default functions roles
- [MPP-425] Changed: contact's label in healthsheet
- [MPP-415] Added: bike, glasses, hearing_aid, nap, weight and emotional_support in healthsheet
- [MPP-418] Added: allergy treatment
- [MPP-418] Fixed: allergy consequences
- [MPP-419] Added: mutuality in healthsheet
- [MPP-413] Added: authorizations in healthsheet

1.6.0
-----------------
- [MPP-405] Added: send user uuid to passerelle, to construct homepage
- [MPP-405] Changed: update combo settings

1.5.0
------------------
- [MPP-403] Added: fetch parent's plain's structured communication
- [MPP-404] Added: default complementary infos
- [MPP-401] Added: list of plains in feedback at the end of registrations finalization
- [MPP-421] Changed: payment instructions mail object

1.4.3
------------------
- [MPP-420] Fixed: failed parent self-registration can be regularized
- [MPP-407] Fixed: set unsuccessful plains registrations status as final

1.4.2
------------------
- [MPP-383] Fixed: failed parent adding to child can be regularized

1.4.1
------------------
- [MPP-383] Fixed: manage error if adding parent to child fails"

1.4.0
------------------
- [MPP-386] Added: agent-manageable options to lock plains registration to local citizens
- [MPP-384] Fixed: warn user about 3 days cancelation if bank transfer is activated

1.3.3
------------------
- [MPP-385] Updated: ask for user's phone number
- [MPP-384] Changed: cancel plain reservations after 3 days without validation also if bank transfer is configured


1.3.2
------------------
- Changed: deadline for meal unregistration can now be current day

1.3.1
------------------
- [MPP-382] Removed: combo agent site structure

1.3.0
------------------
- [MPP-362] Added: alert before registration cancellation when parent does not pay

1.2.0
------------------
- [MPP-364] Added: meal unregistration deadline [nhislaire]

1.1.0
------------------

- [MPP-340] Changed: New meal calendar [nhislaire]
- [MPP-341] Add: meal unregistration [nhislaire]

1.0.0
------------------

- Rebase all portal [nhi]

0.2.37
------------------

- [MPP-188] Fixed: Use Django syntax to prevent evaluation errors [dmshd]

0.2.36
------------------
  - Fixed: regie_id when manual amount is used

0.2.35
------------------
  - Added: aes-enfant json datasource
  - Added: implantations-scolaires json datasource
  - Updated: meal registration form and workflwo to use new datasources
  - Removed: old implantations-scolaire python datasource

0.2.34
------------------
  - Added : Send an email to portal agent when parent unsubscribe their child from meals [nhi]
  - Added : Alert to user if his unsubscribe child to meals request was successful [nhi]
  - Fixed : email to parent when they unsubscribe their child from meals [nhi]
  - Fixed : condition in register child to meals [nhi]
  - Fixed : typo in parent registering workflow [nhi]

0.2.33
------------------

- Send mail to submitter if free up places
- check if child exist directly in form and display error
  [nhi]

0.2.32
------------------

- set author to iA.Téléservices team
- set version in setup.py
- use iateleservicesCreateDeb pipeline function
- set install path in jenkinsfile
  [nhi]

0.2.31
------------------

- add -k option to curl to avoid SSL problems
  [dmu]

0.2.30
------------------

- Fix error in form inscription aux repas
- Fix date in form inscription aux repas feedback
  [nhi]

0.2.29
------------------

- Remove deprecated forms and wfs
  [nhi]

0.2.28
------------------

- Use empty list instead of nonetype if parent try plain's registration without child
  [nhi]

0.2.27
------------------

- Define regie in form option
  [nhislaire]

0.2.26
------------------

- Mention "municipality's site" instead of "school's site" for social media authorisation
  [nhislaire]

0.2.25
------------------

- change message if registering child already exist
  [nhislaire]

0.2.24
------------------

- fix: does child take medication field in healthsheet
  [nhislaire]

0.2.23
------------------

- add not aes-linked fields from medical autorisation, rgpd and covid in healthsheet
  [nhislaire]

0.2.22
------------------

- auto import new info cells
  [nhislaire]

0.2.21
------------------

 - add custom info-cell
 - get blood type from aes
 - fix get healthsheet webservice
   [nhislaire]

0.2.20
------------------

- send first mail to user only if epayment
- reformulate registration's error last status
  [nhislaire]

0.2.19
------------------

- remove message about preselected plains
  [nhislaire]

0.2.18
------------------

- adapt message about preselected plains to be always displayable
  [nhislaire]

0.2.17
------------------

- display full month in plain registration summaries
- display info message about preselected plains, just above them, in form
  [nhislaire]

0.2.16
------------------

- fix text in no more places status
- display theme and monday's date in summary
- display limit before free up places in summary mail when epayment
  [nhislaire]

0.2.15
------------------

- send parent's phone number to AES during his registration
  [nhislaire]

0.2.14
------------------

- completing display registering's validation from AES
  [nhislaire]

0.2.13
------------------

- fix commentaires in mail
  [neslva]

0.2.12
------------------

- fix slug to Fiche santé in Inscrire mon enfant à une plaine
  [nselva]

0.2.11
------------------

- fix validations message in plain's registration
  [nhislaire]

0.2.10
------------------

- rework validations messages in plain's registration
- always display a message if child's registration to plains fails
  [nhislaire]

0.2.9
------------------

- do not loop in validation if an error occurs
  [nhislaire]

0.2.8
------------------

- allow no validation when a parent encodes a new doctor
- simplify workflow healthsheet
- add other payment means after default online one
  [nhislaire]
- add bank transfer as a default payment mean
  [nselva]

0.2.6
------------------

- add missing wscall get children by parent nrn
  [nhislaire]

0.2.5
------------------

- fix get_avalaible_plaines category name's option
  [nhislaire]

0.2.4
------------------

- manage in/out town's pricing
  [nhislaire]

0.2.3
------------------

- update form and wf register child to plains
  [nhislaire]

0.2.2
------------------

- use parent's nrn to get his children in forms healthsheet and register my child to an activity
- display service jeunesse mail if a plain is complete for register into a waiting list
  [nhislaire]

0.2.1
------------------

- add wscall get available plaines to use passerelle method get plaine v2
- fix : remove extra dash in imio indus deploy option
  [nhislaire]

0.2.0
------------------

- add adapted package to publik's industrialisation
  [nhislaire]

0.1.9
------------------

- use parent's RN instead of his mail in combo settings
- rename healthsheet's questions datasource reference in healthsheet workflow
- add passerelles if missing
  [nhislaire]

0.1.8
------------------

- Add aes_doctors datasource
- Use dynamic urls
- Use wscall instead of action webservice
- Redirect user to healthsheet after child registration
  [nhislaire]

0.1.7
------------------

- use parent national number instead of mail
- check if parent or child are existing with their national number
- let the agent notifying a demand as regularized
- overall updates from Chaudfontaine and staging2
  [nhislaire]

0.1.6
------------------

- init buster branch that will become master later and adapt Jenkinsfile for Debian Buster (nexus)
  [dmuyshond]

0.1.5s
------------------

- do not use a webservice if we are in the form factory for "Inscrire mon enfant aux repas"
  [nhislaire]
- fix python datasource in field Menu "Inscrire mon enfant aux repas"
  [nhislaire]

0.1.5r
------------------

- Remove character used to comment an line
  [nhislaire]

0.1.5q
------------------

- Replace the last imio-town-street by imio-ts-aes in readme
  [nhislaire]
- Fix syntax error in changelog
  [nhislaire]
- Refactor datasources deployement
  [nhislaire]

0.1.5p
------------------

- Replace imio-town-street by imio-ts-aes in readme
  [nhislaire]
- Remove existing alphanumeric IDs for roles in WF
  [nhislaire]

0.1.5n
------------------

- Remove aes_test_menu and adapt aes_get_menu to call good endpoint if form is in test mode or not.
  [boulch]

0.1.5m
------------------

- Meals form : Use wscalls to get meals menu (instead of named datasource). There is now a new "test" option on the form
  [boulch]
- Add 2 new wscalls (get meals menu and test meals menu)
  [boulch]
- Meals workflow : Fix webservice calling + add wf variable to add a "test" form option.
  [boulch]

0.1.5l
------------------

- CHANGES.rst init
  [dmuyshond]
