And (/^click on link 'Alocar'$/) do
	first(:link,'Alocar').click
end

And (/^I fill in search with '([^"]*)'$/) do |value|
  find(:css, "input[id$='input-search-field']").set(value)
end

And (/^print the result search$/) do
  expect(page).to have_content('Cálculo 3')
  expect(page).to have_content('Cálculo 1')
end
