Feature: Filter rooms
	To use application resources
	As a system user
	I would like to filter rooms

	Background:
		Given I am logged in as assistant administrative
		When click on link 'Salas'

	Scenario: Filter by name
		And I fill in the filter 'name' with 'FGA-I1'
		When I press 'Pesquisar' button
		Then the 'Salas' page should load with message 'FGA-I1'

	Scenario: Filter by code
		And I fill in the filter 'code' with '183364'
		When I press 'Pesquisar' button
		Then the 'Salas' page should load with message '183364'

 	Scenario: Filter by capacity
		And I fill in the filter 'capacity' with '45'
		When I press 'Pesquisar' button
		Then the 'Salas' page should load with message '183364'

	Scenario: Filter by Build
		And I select the building 'Unidade Acadêmica'
		Then the 'Salas' page should load with message 'Unidade Acadêmica'

	Scenario: Filter by All
		And I fill in the filter 'name' with 'FGA-I1'
		And I fill in the filter 'code' with '183364'
		And I fill in the filter 'capacity' with '45'
		And I select the building 'Unidade Acadêmica'
		Then the 'Salas' page should load with the result of the search
