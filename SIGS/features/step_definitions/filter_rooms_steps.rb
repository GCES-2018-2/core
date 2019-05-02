And (/^I fill in the filter '([^"]*)' with '([^"]*)'$/) do |field, name|
  fill_in(field.to_sym, with: name)
end

And (/^I select the building '([^"]*)'/) do |building|
	select building, from: 'building_id'
end

# And (/^I select the wing '([^"]*)'/) do |wing|
# 	select wing, from: 'wing'
# end

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

Then (/^the 'Salas' page should load with rooms in 'Norte' wing$/) do
  expect(page).to have_content('S10')
  expect(page).to have_content('124325')
  expect(page).to have_content('Sim')
  expect(page).to have_content('Pavilhão Anísio Teixeira')
  expect(page).to have_content('S8')
  expect(page).to have_content('987654')
  expect(page).to have_content('Sim')
  expect(page).to have_content('Pavilhão Anísio Teixeira')
end
