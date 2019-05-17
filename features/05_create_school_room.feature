Feature: Create school room
	To use application resources
	As a coordinator user
	I would like to create a new School room
	
	Background:
		Given I am logged in as coordinator
		And click on link 'Gerenciar Turmas'
		And click on link 'Criar Nova Turma'
		And I select '1' in 'discipline_id'
		And I search 10 in courses

	Scenario: create school room with valid attributes
		And I fill in school room 'name' with 'DD'
		And I fill in school room 'vacancies' with '50'

	Scenario: create school room with valid attributes adding category
		And I check 'Retroprojetor'
		And I fill in school room 'name' with 'DD'
		And I fill in school room 'vacancies' with '50'

	Scenario: create school room with lower vacancies
		And I fill in school room 'name' with 'DD'
		And I fill in school room 'vacancies' with '1'
		When I press 'Salvar' button
		Then notice message 'A capacidade mínima é 5 vagas'

	Scenario: create school room with high vacancies
		And I fill in school room 'name' with 'DD'
		And I fill in school room 'vacancies' with '800'
		When I press 'Salvar' button
		Then notice message 'A capacidade máxima é 500 vagas'
