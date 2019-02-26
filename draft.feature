# encoding: utf-8
# lang: en

Feature: User edits subject headings

  Scenario: A user visits the start page for the first time
    Given that the user using their web browser
    When they navigate to the start page
    Then they are shown the start page with a log-in menu

  Scenario: A user logs in (what is the test strategy for Feide, here?)                             # 5
    Given that the user is on the start page
    When they click log in
    And they select their institution
    And they enter their username and password
    Then they are logged in and are routed to their personal page

  Scenario: A user is already logged in and navigates to the start page
    Given that the user using their web browser
    And they have previously logged in
    When they navigate to the start page
    Then they are routed to their personal page
    And they see:
      | their user id                    |
      | available subject headings table |
      | log out button                   |

  Scenario: User selects a subject heading system to work with                                      # 1
    Given that the user is logged in
    And there are subject heading systems
    And they are on their personal start page
    When they look at the "available subject heading systems" table
    And they click a subject heading system
    Then they are taken to the start page for the subject heading system
    
  Scenario: User searches for a term from the subject heading system start page                     # 1
    Given that the user is on the start page for a subject heading system
    When they search for a term that exists within the subject heading system
    Then they are presented with a list of search results from the subject heading system
    And the list contains the term they searched for

  Scenario: A user clicks a search result in a subject heading system and is shown the term
    Given that the user has searched for a term in a subject heading system
    When they click on a search result
    Then they are shown the term in the editor
    
  Scenario: User searches for a term in a subset of all available subject heading systems           # 1
    Given that the user is on their personal page
    And there are several available subject heading systems
    When they enter a search term in the search box
    And they uncheck one of the systems in the subject heading system search targets list
    Then they see results from the remaining checked subject heading systems

  Scenario: User searches for a term in all available subject heading systems                       # 8
    Given that the user is on their personal page
    And there are several available subject heading systems
    When they enter a search term in the search box
    Then they see results from all subject heading systems

  Scenario: User attempts to search in nothing
    Given that the user is on their personal page
    And there are several available subject heading systems
    When they enter a search term in the search box
    And they uncheck all but one of the subject heading systems
    Then the checkbox for the last subject heading system is disabled

  Scenario: User searches for a term in fields and using boolean search tools                       # 1
    Given that the user is on their personal page
    And there are several available subject heading systems
    When they enter a search term in the search box such as
      | Hous?cat           |
      | *ouseca*           |
      | Cat* AND *cat      |
      | Cat* OR *cat       |
      | prefLabel: Cats    |
      | altLabel: Housecat |
    Then they see results for Cats and Housecats

  Scenario: User adds different language labels to a term                                                 # 1
    Given that a user is editing a term in a subject heading system that allows preferred labels with language:
      | Norwegian   |
      | English     |
    When they add a preferred label in each language
    And they specify a language for each label
    And they click save
    Then they see that the term is updated with the changes
    And the activity is logged

  Scenario: User adds internal relations to a term                                                  # 1 (more)
    Given that a user is editing a term in a subject heading system that allows internal relations:
      | See other |
      | Used for  |
      | Broader   |
      | Narrower  |
    When the user creates a relation
    And they enter text in the search box for the relation
    And they select a search result
    Then the relation is added to the term
    And the user sees the term and its short identifier in the editor
    And the activity is logged


  Scenario: User edits a term                                                                       # 1
    Given that a user is searches for an existing term
    When they click the term in the search results list
    Then they are taken to the editor and it is populated with that term

  Scenario: User deletes a term                                                                     # 1
    Given that a user is editing a term
    When they click delete term
    And answer yes to Do you want to delete the term (term) prompt
    Then the term is deleted
    And the activity is logged

  Scenario: User deletes a term with orphaned relations                                             # 2
    Given that a user is editing a term that is the object of a relation in another term
    When they click delete term
    Then they are warned that they cannot delete the term until the relation is removed

  Scenario: User adds relations to external data sources to a term                                  # 2
    Given that a user is editing a term in a subject heading system that allows external relations
    When they add an HTTP-IRI to the external relation field
    And they click save
    Then the relation is saved
    And the activity is logged

  Scenario: User adds a user to the list of editors for a subject heading system                    # 3
    Given that the user is on the page for a subject heading system
    When they click Add user
    And they enter the Feide ID of a user as a new line in the Users textarea
    And they click save
    Then the new user has access to the subject heading system page

  Scenario: User creates a new term (needs to be analysed)                                          # 8
    Given that the user is on the start page for a subject heading system
    When they click create new term
    And they enter a term editor with the fields specified in the subject heading system schema
    And they click save
    Then the term is created
    And the activity is logged

  Scenario: User adds history note to a term (fields)                                               # 1
    Given that a user has created a new term in a subject heading system that specifies fields for:
      | preferred label   |
      | alternative label |
      | scope note        |
      | history note      |
    When they add text to each field
    And click save
    Then they see the changes are saved
    And the changes are logged

  Scenario: User downloads MARC dump (how, what?)                                                   # ∞
    Given that the user is on the start page for a subject heading system
    When they click Generate MARC dump
    Then they see a link to the MARC dump in the interface with a message to wait until the dump is complete
    And the MARC dump is updated
    And the change is logged

  Scenario: User downloads RDF dump (how, what?)                                                    # ∞
    Given that the user is on the start page for a subject heading system
    When they click Generate RDF dump
    Then they see a link to the RDF dump in the interface with a message to wait until the dump is complete
    And the RDF dump is updated
    And the change is logged

  Scenario: User looks up term in Alma and adds it to a bibliographic record (needs to be analysed) # ∞
  Scenario: User adds CC-mapping data to a subject system (is this a data import, or per term?)     # ∞
  Scenario: User views change log (how, what?)                                                      # ∞

