Feature: Approve registration
	To use application resources
	As a administrative assistant user
	I would like to approve or recuse registration

	Background:
		Given I am logged in as assistant administrative
		And click on link 'Usuários'
		And click on link 'Cadastros Pendentes'

	Scenario: approve a registration
		When I press 'Approve' button
		Then notice message 'Usuário aprovado com sucesso'

	Scenario: recuse a registration
		When I press 'Recuse' button
		Then notice message 'Usuário recusado com sucesso'

	Scenario: there is no registration
		When I press 'Recuse' button
		When I press 'Recuse' button
		When I press 'Recuse' button
		Then notice message 'Não há nenhuma solicitação pendente no momento.'

