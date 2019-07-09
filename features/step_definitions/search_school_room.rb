And (/^click on link 'Alocar'$/) do
	first(:link,'Alocar').click
end

And (/^click on button 'Filtrar'$/) do
	click_button('Filtrar')
end

And (/^I fill in 'Disciplina' with '([^"]*)'$/) do |value|
  find(:css, "input[class$='select-filter']").set(value)
end

Then (/^notice message 'Pesquisa de Turmas$/) do
	expect(page).to have_content('Pesquisa de Turmas')
end

And (/^print the result search$/) do
  expect(page).to have_content('Cálculo 1')
end

And (/^I select the alocação '([^"]*)'/) do |allocation|
	select allocation, from: 'allocation_selected'
end

Then (/^the 'Disciplinas' page should load with message 'Cálculo 3'$/) do
  expect(page).to have_content('Cálculo 3')
end