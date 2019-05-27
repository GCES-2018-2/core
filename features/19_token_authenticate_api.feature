Feature: Token authenticate API
	To use application resources
	As a system user
	I would like to Generate token of a API user

  Background:
    Given I am logged in as assistant administrative

  Scenario: show a list of API users created
    And click on link 'API'
    Then the page 'Usuário de API' must show two API users

  Scenario: show no one API users in the table
    And delete all API users
    And click on link 'API'
    Then the page 'Usuário de API' must show no one API users

  Scenario: create a API user valid
    And click on link 'API'
    And click on link 'Criar Usuário de API'
    And I fill in api 'name' with 'Otavio Socrates'
    And I fill in api 'email' with 'otavio.socrates@hotmail.com'
    When I press 'Salvar' button
		Then the page 'Usuário de API' notice message 'Usuário de API salvo'
    # And the page 'Usuário de API' must show the details of API user Otavio Socrates

  Scenario: create a API user with invalid name and email
    And click on link 'API'
    And click on link 'Criar Usuário de API'
    And I fill in api 'name' with 'Paula'
    And I fill in api 'email' with 'aninha'
    When I press 'Salvar' button
		Then the page 'Criar Usuário de API' notice message 'Usuário de API não foi salvo'
    And the page 'Criar Usuário de API' must show the errors

  Scenario: create a API user with valid name and a repeated email
    And click on link 'API'
    And click on link 'Criar Usuário de API'
    And I fill in api 'name' with 'Ana Paula Chaves'
    And I fill in api 'email' with 'anapaula.chaves@gmail.com'
    When I press 'Salvar' button
		Then the page 'Criar Usuário de API' notice message 'Usuário de API não foi salvo'
    And the page 'Criar Usuário de API' must show the error of repeated email

  Scenario: edit a API user existent
    And click on link 'API'
    And click on link 'Icon edit'
    And I fill in api 'name' with 'Hendrick Mathews'
    And I fill in api 'email' with 'hendrick.mathews@gmail.com'
    When I press 'Salvar' button
    Then the page 'Editar Usuário de API' notice message 'Usuário de API atualizado com sucesso'
    # And the page 'Usuário de API' must show the details of API user Hendrick Mathews

  Scenario: edit a API user existent with invalid attributes
    And click on link 'API'
    And click on link 'Icon edit'
    And I fill in api 'name' with 'Thay'
    And I fill in api 'email' with 'thay'
    When I press 'Salvar' button
    Then the page 'Editar Usuário de API' notice message 'Usuário de API não pode ser atualizado'
    And the page 'Criar Usuário de API' must show the errors

  Scenario: delete a API user existent
    And click on link 'API'
    And click on link 'Icon trash'
