And (/^I fill in the filter '([^"]*)' with '([^"]*)'$/) do |field, name|
  fill_in(field.to_sym, with: name)
end

And (/^I select the building '([^"]*)'/) do |building|
	select building, from: 'building_id'
end

Then (/^the 'Salas' page should load with message 'FGA-I1'$/) do
  expect(page).to have_content('FGA-I1')
end

Then (/^the 'Salas' page should load with message '183364'$/) do
  expect(page).to have_content('183364')
end

Then (/^the 'Salas' page should load with message '183382'$/) do
  expect(page).to have_content('183382')
end

Then (/^the 'Salas' page should load with message 'Unidade Acadêmica'$/) do
	expect(page).to have_content('Unidade Acadêmica')
end

And (/^I press 'Pesquisar' button$/) do
  click_button('Pesquisar')
end

Then (/^the 'Salas' page should load with the result of the search$/) do
  expect(page).to have_content('FGA-I1')
  expect(page).to have_content('183364')
  expect(page).to have_content('Sim')
  expect(page).to have_content('Unidade Acadêmica')
end
