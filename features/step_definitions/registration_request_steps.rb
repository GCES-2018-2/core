When (/^click on button 'Solicitar Cadastro'$/) do
	click_link ('Solicitar Cadastro')
end

And (/^I fill in user '([^"]*)' with '([^"]*)'$/) do |field, value|
	fill_in("user[#{field}]", :with=> value)
end

And (/^I fill in user type with '([^"]*)'$/) do |value| 
	choose(value)
end

When (/^I press 'Enviar' button$/) do
	click_button('Enviar')
end
