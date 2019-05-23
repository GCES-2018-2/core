Feature: Generate school room reports
  To use application resources
  As a system user
  I would like to generate a report by school room

	Background:
		Given I am logged in as coordinator
		And click on link 'Relatórios'
		And click on link 'Turmas' in 'Relatório'

	Scenario: Generate report of all school rooms
		And I fill in 'relatorio' with 'Todas'
		When I press 'Gerar Relatório de Todas as Turmas' link

	Scenario: Generate report of allocated school rooms
		And I fill in 'relatorio' with 'Alocadas'
		When I press 'Gerar Relatório de Turmas Alocadas' link

	Scenario: Generate report of unallocated school rooms
		And I fill in 'relatorio' with 'Não Alocadas'
		When I press 'Gerar Relatório de Turmas Não Alocadas' link

