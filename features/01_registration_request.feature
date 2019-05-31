Feature: Registration Request
	To use application resources
	As a visitor user
	I would like to request a registration

  Background:
    Given I am on the log in page
    When click on button 'Solicitar Cadastro'

	Scenario: Request registration of a user with valid attributes
		And I fill in user 'name' with 'gesiel freitas'
		And I fill in user 'cpf' with '02919147307'
		And I fill in user 'registration' with '2244537'
		And I fill in user 'password' with '123456'
		And I fill in user 'password_confirmation' with '123456'
		And I fill in user 'email' with 'gesiel@unb.br'
		And I fill in user type with 'adm_as'
		When I press 'Enviar' button
		Then notice message 'Solicitação de cadastro efetuado com sucesso!'

  Scenario: Request registration of a user with invalid name
    And I fill in user 'name' with 'Ana'
    And I fill in user 'cpf' with '02919147307'
    And I fill in user 'registration' with '2244537'
    And I fill in user 'password' with '123456'
    And I fill in user 'password_confirmation' with '123456'
    And I fill in user 'email' with 'gesiel@unb.br'
    And I fill in user type with 'coord'
    When I press 'Enviar' button
    Then notice message 'O Nome deve ter no mínimo 7 caracteres'

  Scenario: Request registration of a user with invalid cpf
    And I fill in user 'name' with 'gesiel freitas'
    And I fill in user 'cpf' with '1234'
    And I fill in user 'registration' with '2244537'
    And I fill in user 'password' with '123456'
    And I fill in user 'password_confirmation' with '123456'
    And I fill in user 'email' with 'gesiel@unb.br'
    And I fill in user type with 'deg_user'
    When I press 'Enviar' button
    Then notice message 'Insira um CPF válido'

  Scenario: Request registration of a user with invalid cpf
    And I fill in user 'name' with 'gesiel freitas'
    And I fill in user 'cpf' with '02919147307'
    And I fill in user 'registration' with '2244537'
    And I fill in user 'password' with '123456'
    And I fill in user 'password_confirmation' with '123456'
    And I fill in user 'email' with ''
    And I fill in user type with 'adm_as'
    When I press 'Enviar' button
    Then notice message 'E-mail não pode ser vazio'
