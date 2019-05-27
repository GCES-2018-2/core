And (/^click on link 'Usuários'$/) do
	first(:link, 'Usuários').click
end

And (/^click on link 'Cadastros Pendentes'$/) do
	first(:link,'Cadastros Pendentes').click
end

When (/^I press 'Approve' button$/) do
	first(:link, 'Approve').click
end

When (/^I press 'Recuse' button$/) do
	first(:link, 'Recuse').click
end
