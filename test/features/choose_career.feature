Feature:Chose Career
#As a Visitor:Candidate of DGU, named Alice
#I want to choose my career
#So that I can get career maps
  Background:
#    Given a Candidate named Alice
    Given Alice is on the Choose Career page

  Scenario: Loading first contents for Choosing Career page
    When Alice waiting
    Then Alice see {'txt-title'}
    And Alice see {'lv-list_career'}

  Scenario: Know which Career is currently selected
  Given {'Technology'} item has gray color
  When Alice click {'Technology'} item
  Then {'Technology'} item has green color

  Scenario: Change title when choosing career
  Given {'txt-title'} text field has text {'Please chose your career'}
  When Alice click {'Technology'} item
  Then {'txt-title'} text field has text {'You are choosing'}

  Scenario: Change selected Career
  When Alice click {'Technology'} item
  Then {'Technology'} item has green color
  And {'Life Style'} item has gray color
  When Alice click {'Life Style'} item
  Then {'Technology'} item has gray color
  And {'Life Style'} item has green color

  Scenario: Change display mode for next time visit
  When Alice click {'Technology'} item
  Then The checkbox {'cb-display_again'} is checked
  When Alice click {'grp-display_again'}
  Then The checkbox {'cb-display_again'} is unchecked
  When Alice click {'grp-display_again'}
  Then The checkbox {'cb-display_again'} is checked

  Scenario: Show button and checkbox
  Given {'grp-checkbox_button'} group is disappear
  When Alice click {'Technology'} item
  Then {'grp-checkbox_button'} group is appear

  Scenario: UnShow/Show button and checkbox when scroll down/up
  When Alice click {'Technology'} item
  And Alice scroll down Career list
  Then {'grp-checkbox_button'} group is disappear
  When Alice scroll up Career list
  Then {'grp-checkbox_button'} group is appear

  Scenario: Redirect to another page
  Given Alice click {'Technology'} item
  And {'grp-checkbox_button'} group is appear
  When Alice click {'btn-confirm_career'}
  Then Alice redirect to the Career Map page