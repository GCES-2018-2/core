Feature: Index School Rooms
  To use application resources
  As a coordinator user
  I would like to search school rooms

  Background:
		Given I am logged in as coordinator
		And click on link 'Gerenciar Turmas'

  Scenario: search existing school room
		And I fill in search with 'Cal'
		And click on button 'searchButton'
    And print the result search

  Scenario: search not existing school room
		And I fill in search with 'Art'
		And click on button 'searchButton'
    Then notice message 'Nenhuma turma encontrada'

  Scenario: search existing school room in result page
    And I fill in search with 'Cal'
    And click on button 'searchButton'
    And print the result search
    And I fill in search with 'Cal'
    And click on button 'searchButton'
    And print the result search
