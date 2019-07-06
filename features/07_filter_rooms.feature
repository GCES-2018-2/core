Feature: Filter rooms
	To use application resources
	As a system user
	I would like to filter rooms

	Background:
		Given I am logged in as assistant administrative
		When click on link 'Salas'

	@by_name
	Scenario: Filter by name
		And I select the name 'FGA-I1' 
		Then the 'Salas' page should load with message 'FGA-I1'

	@by_code
	Scenario: Filter by code
		And I fill in the filter 'code_selected' with '987653'
		When I press 'Pesquisar' button
		Then the 'Salas' page should load with message '987653'

	@by_capacity
 	Scenario: Filter by capacity
		And I select the capacity '0-50' 
		Then the 'Salas' page should load with message '987655'

	@by_build
	Scenario: Filter by Build
		And I select the building 'Pavilhão João Calmon'
		Then the 'Salas' page should load with message 'Pavilhão João Calmon'

	@by_all
	Scenario: Filter by All
	    And I select the name 'FGA-I1'
		And I fill in the filter 'code_selected' with '987653'
		And I select the capacity '0-50' 
		And I select the building 'Pavilhão João Calmon'
		Then the 'Salas' page should load with the result of the search
