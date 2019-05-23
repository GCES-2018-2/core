Given (/^I am logged in as coordinator$/) do
	visit 'http://192.168.2.15:3000'
	fill_in('session[email]', :with=> 'coordenador@unb.br')
	fill_in('session[password]', :with=> '123456')
  	click_button('Entrar')
end

And (/^click on link 'Criar Nova Turma'$/) do
	click_link ('Criar Nova Turma')
end

And (/^click on link 'Gerenciar Turmas'$/) do
	first(:link, 'Gerenciar Turmas').click
end

And (/^I select '1' in 'discipline_id'$/) do
	find_field('school_room_discipline_id').find("option[value='1']").text
end

And (/^I fill in school room '([^"]*)' with '([^"]*)'$/) do |option, value|
	fill_in("school_room[#{option}]", :with=> value)
end

And (/^I check 'Retroprojetor'$/) do
	find(:css, "#school_room_category_ids_1").set(true)
end

And (/^I search 10 in courses$/) do
   find(:css, "input[id$='input-search-courses']").set("10")
end

Then (/^notice message 'Turma criada'$/) do
	# expect(page).to have_content('Turma criada')
end
