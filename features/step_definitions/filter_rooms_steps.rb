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

Then (/^the 'Salas' page should load with message '183365'$/) do
  expect(page).to have_content('183365')
end

Then (/^the 'Salas' page should load with message 'FGA-I1'$/) do
  expect(page).to have_content('FGA-I1')
end

Then (/^the 'Salas' page should load with message '183363'$/) do
  expect(page).to have_content('183363')
end

Then (/^the 'Salas' page should load with message '183371'$/) do
  expect(page).to have_content('183371')
end

Then (/^the 'Salas' page should load with message 'Unidade Acadêmica'$/) do
	expect(page).to have_content('Unidade Acadêmica')
end

And (/^I press 'Pesquisar' button$/) do
  click_button('Pesquisar')
end

Then (/^the 'Salas' page should load with the result of the search$/) do
  expect(page).to have_content('FGA-I2')
  expect(page).to have_content('183363')
  expect(page).to have_content('50-100')
  expect(page).to have_content('Unidade Acadêmica')
end
