# encoding: utf-8
# lang: en

Feature: User edits subject headings
  Scenario: A user logs in                                                                          # 1
    Given that the user is on the start page
    When they click log in
    And they select their institution
    And they enter their username and password
    Then they are logged in and are routed to their personal page
    
  Scenario: User selects a subject heading system to work with                                      # 1
    Given that the user is logged in 
    And they are on their personal start page
    When they look at the "available subject heading systems" table
    And they click a subject heading system
    Then they are taken to the start page for the subject heading system
    
  Scenario: User searches for a term from the subject heading system start page                     # 1
    Given that the user is logged in
    And that they are on the start page for a subject heading system
    When they search for a term that exists within the subject heading system
    Then they are presented with a list of search results from the subject heading systerm
    And the list contains the term they searched for
    
  Scenario: User searches for a term in a subset of all available subject heading systems           # 1
  Scenario: User searches for a term in all available subject heading systems                       # 1
  Scenario: User searches for a term in fields and using boolean search tools                       # 1
  Scenario: User adds two language labels to a term                                                 # 1
  Scenario: User adds internal relations to a term                                                  # 1 (more)
  Scenario: User edits a term                                                                       # 1
  Scenario: User deletes a term                                                                     # 1
  Scenario: User deletes a term with orphaned relations                                             # 2
  Scenario: User adds relations to external data sources to a term                                  # 2
  Scenario: User adds a user to the list of editors for a subject heading system                    # 3
  Scenario: User logs in (needs to be analysed)                                                     # 5
  Scenario: User creates a new term (needs to be analysed)                                          # 8
  Scenario: User searches for a term in all available subject heading systems (needs to be analysed)# 8
  Scenario: User looks up term in Alma and adds it to a bibliographic record (needs to be analysed) # ∞
  Scenario: User adds CC-mapping data to a subject system (is this a data import, or per term?)     # ∞
  Scenario: User downloads MARC dump (how, what?)                                                   # ∞
  Scenario: User downloads RDF dump (how, what?)                                                    # ∞
  Scenario: User views change log (how, what?)                                                      # ∞
  Scenario: User adds history note to a term                                                        # 1
  
Feature: User searches
