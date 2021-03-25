Changelog
=========

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
