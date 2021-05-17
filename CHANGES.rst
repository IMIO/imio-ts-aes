Changelog
=========

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
