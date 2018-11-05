Feature: Filter rooms
	To use application resources
	As a system user
	I would like to filter rooms
	
	Background:
		Given I am logged in as assistant administrative
		When click on link 'Salas'

	Scenario: Filter by name
		And I fill in the filter 'name' with 'S10'
		When I press 'Pesquisar' button
		Then the 'Salas' page should load with message 'S10'

	Scenario: Filter by code
		And I fill in the filter 'code' with '987653'
		When I press 'Pesquisar' button
		Then the 'Salas' page should load with message '987653'

 	Scenario: Filter by capacity
		And I fill in the filter 'capacity' with '50'
		When I press 'Pesquisar' button
		Then the 'Salas' page should load with message '124325'

	Scenario: Filter by Build
		And I select the building 'Pavilhão João Calmon'
		Then the 'Salas' page should load with message 'Pavilhão João Calmon'

	Scenario: Filter by Wings
		And I select the wing 'NORTE'
		Then the 'Salas' page should load with rooms in 'Norte' wing

	Scenario: Filter by All
		And I fill in the filter 'name' with 'S10'
		And I fill in the filter 'code' with '124325'
		And I fill in the filter 'capacity' with '50'
		And I select the building 'Pavilhão Anísio Teixeira'
		Then the 'Salas' page should load with the result of the search
