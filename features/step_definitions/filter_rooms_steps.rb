And (/^I select the name '([^"]*)'/) do |name|
  select name, from: 'room_id'
end

And (/^I select the capacity '([^"]*)'/) do |capacity|
  select capacity, from: 'capacity_range'
end

And (/^I fill in the filter '([^"]*)' with '([^"]*)'$/) do |field, code_selected|
  fill_in(field.to_sym, with: code_selected)
end

And (/^I select the building '([^"]*)'/) do |building|
	select building, from: 'building_id'
end

Then (/^the 'Salas' page should load with message '987655'$/) do
  expect(page).to have_content('987655')
end

Then (/^the 'Salas' page should load with message 'FGA-I1'$/) do
  expect(page).to have_content('FGA-I1')
end

Then (/^the 'Salas' page should load with message 'S10'$/) do
  expect(page).to have_content('S10')
end

Then (/^the 'Salas' page should load with message '987653'$/) do
  expect(page).to have_content('987653')
end

Then (/^the 'Salas' page should load with message '124325'$/) do
  expect(page).to have_content('124325')
end

Then (/^the 'Salas' page should load with message 'Pavilhão João Calmon'$/) do
	expect(page).to have_content('Pavilhão João Calmon')
end

And (/^I press 'Pesquisar' button$/) do
  click_button('Pesquisar')
end

Then (/^the 'Salas' page should load with the result of the search$/) do
  expect(page).to have_content('FGA-I1')
  expect(page).to have_content('987653')
  expect(page).to have_content('0-50')
  expect(page).to have_content('Pavilhão João Calmon')
end
