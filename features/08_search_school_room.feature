Feature: Index School Rooms
  To use application resources
  As a coordinator user
  I would like to search school rooms

  Background:
		Given I am logged in as coordinator
		And click on link 'Gerenciar Turmas'

  Scenario: search existing school room
    And I fill in 'Disciplina' with 'Cálculo 1'
    And print the result search

  Scenario: search not existing school room
    And I fill in 'Disciplina' with 'Example'
    And click on button 'Filtrar'
    Then notice message 'Pesquisa de Turmas'

  @teste
  Scenario: search allocated school room
      And I select the alocação 'Alocadas'
      Then the 'Disciplinas' page should load with message 'Cálculo 3'
