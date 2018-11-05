Feature: Manager User
  To use application resources
  As a system user
  I would like to manager a user account

  Background:
    Given I am logged in as assistant administrative

  Scenario: Change name and password both valid of a user
    When click on link 'Perfil'
    And I fill in 'password-user' with '654321'
    And I fill in 'confirm_password' with '654321'
    When I press 'Salvar' button
    Then the 'Perfil' page should load with notice message 'Dados atualizados com sucesso'

  Scenario: Change name and password both invalid of a user
    When click on link 'Perfil'
    And I fill in 'password-user' with '654'
    And I fill in 'confirm_password' with '654'
    When I press 'Salvar' button
    Then the 'Perfil' page should load with notice message 'Dados não foram atualizados'

  Scenario: Delete a only account of a administrative assistant
    When click on link 'Perfil'
    When I press 'Excluir Conta' button
    Then the initial page should load with notice message 'Não é possível excluir o único assistante Administrativo'

  Scenario: Delete another account of a user
    And I delete all the allocations of this user
    And click on link 'Usuários'
		And click on link 'Usuários Registrados'
    When I press 'Delete' button
    Then the 'Usuarios Registrados' page should load with notice message 'Usuário excluído com sucesso'

  Scenario: None registrate users to administer
    And I delete all the allocations of this user
    When I delete anothers registration users
    And click on link 'Usuários'
    And click on link 'Usuários Registrados'
    Then the 'Usuarios Registrados' page should load with notice message 'Não há nenhum usuário registrado no momento.'
