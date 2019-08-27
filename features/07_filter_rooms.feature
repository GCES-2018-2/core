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
		And I fill in the filter 'code_selected' with '183363'
		When I press 'Pesquisar' button
		Then the 'Salas' page should load with message '183363'

	@by_capacity
 	Scenario: Filter by capacity
		And I select the capacity '50-100'
		Then the 'Salas' page should load with message '183365'

	@by_build
	Scenario: Filter by Build
		And I select the building 'Unidade Acadêmica'
		Then the 'Salas' page should load with message 'Unidade Acadêmica'

	@by_all
	Scenario: Filter by All
	    And I select the name 'FGA-I2'
		And I fill in the filter 'code_selected' with '183363'
		And I select the capacity '50-100'
		And I select the building 'Unidade Acadêmica'
		Then the 'Salas' page should load with the result of the search
