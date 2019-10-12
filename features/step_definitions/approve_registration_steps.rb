And (/^click on link 'Usuários'$/) do
	first(:link, 'Usuários').click
end

And (/^click on link 'Cadastros Pendentes'$/) do
	first(:link,'Cadastros Pendentes').click
end

When (/^I press 'Approve' button$/) do
	first(:xpath, "//a/img[@alt='Approve']/..").click
end

When (/^I press 'Recuse' button$/) do
	first(:xpath, "//a/img[@alt='Recuse']/..").click
end
