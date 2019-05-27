Given (/^I am on the log in page$/) do
	visit 'http://192.168.2.15:3000'
end

And (/^I fill in session '([^"]*)' with '([^"]*)'$/) do |field, value|
	fill_in("session[#{field}]", :with=> value)
end

When (/^I press 'Entrar' button$/) do
	click_button('Entrar')
end

Then (/^the initial page should load with notice message 'Login realizado com sucesso'$/) do
	expect(page).to have_content('Login realizado com sucesso')
end

Then (/^the login page should reload with notice message 'Login ou senha inválidos'$/) do
	expect(page).to have_content('Email ou senha incorretos')
end
