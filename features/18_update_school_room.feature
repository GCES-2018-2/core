Feature: Update school room
	To use application resources
	As a coordinator user
	I would like to update a new School room

	Background:
		Given I am logged in as coordinator
		And click on link 'Gerenciar Turmas'
		And click on edit first
		And I select '1' in 'discipline_id'

	Scenario: change school room with valid attributes
		And I fill in school room 'vacancies' with '50'
		When I press 'Alterar' button
		Then notice message 'A turma foi alterada com sucesso'

	Scenario: change school room with low vacancies
		And I fill in school room 'vacancies' with '1'
		When I press 'Alterar' button
		Then notice message 'A capacidade mínima é 5 vagas'

	Scenario: change school room with high vacancies
		And I fill in school room 'vacancies' with '800'
		When I press 'Alterar' button
		Then notice message 'A capacidade máxima é 500 vagas'

	Scenario: change school room with null vacancies
		And I fill in school room 'vacancies' with ''
		When I press 'Alterar' button
		Then notice message 'Capacidade não pode ser vazia'
