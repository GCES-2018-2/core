And (/^I fill in the filter '([^"]*)' with '([^"]*)'$/) do |field, name|
  fill_in(field.to_sym, with: name)
end

And (/^I select the building '([^"]*)'/) do |building|
	select building, from: 'building_id'
end

And (/^I select the wing '([^"]*)'/) do |wing|
	select wing, from: 'wing'
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
  expect(page).to have_content('S10')
  expect(page).to have_content('124325')
  expect(page).to have_content('Sim')
  expect(page).to have_content('Pavilhão Anísio Teixeira')
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
