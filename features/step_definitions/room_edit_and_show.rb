When (/^click on link 'Salas'$/) do
  #first(:link, 'Salas').click
  #visit 'http://192.168.2.15:3000/rooms/index'
  first('.myList').click_link('Salas')
end

And (/^I press 'Icon edit' button$/) do
  first(:link, 'Icon edit').click
end

And (/^I press 'Icon view' button$/) do
  first(:link, 'Icon view').click
end

And (/^I fill in room '([^"]*)' with '([^"]*)'$/) do |option, value|
  fill_in("room[#{option}]", :with=> value)
end

When (/^I delete all rooms$/) do
  @rooms = Room.all
  @rooms.each do |room|
    room.destroy
  end
end

Then (/^the 'Salas' page should load with notice message 'Dados da sala atualizados com sucesso'$/) do
  expect(page).to have_content('Dados da sala atualizados com sucesso')
end

Then (/^the 'Alterar Sala' page should load with notice message 'Dados não foram atualizados'$/) do
  expect(page).to have_content('Dados não foram atualizados')
end

And (/^the 'Alterar Sala' page should load with the errors messages$/) do
  expect(page).to have_content('Informe o código da sala')
  expect(page).to have_content('O Nome deve ter no mínimo 2 caracteres')
  expect(page).to have_content('A capacidade mínima é 5 vagas')
  expect(page).to have_content('A capacidade máxima é 500 vagas')
end

And (/^the 'Alterar Sala' page should load with errors messages of empty fields$/) do
  expect(page).to have_content('O Nome deve ter no mínimo 2 caracteres')
  expect(page).to have_content('A capacidade mínima é 5 vagas')
end

Then (/^the 'Salas' page should load with notice message 'Não há salas registradas no momento.'$/) do
  expect(page).to have_content('Nenhuma sala encontrada.')
end

And (/^the 'Alterar Sala' page should load with a error message of capacity field$/) do
  expect(page).to have_content('A capacidade máxima é 500 vagas')
end

Then (/^the 'Visualizar Sala' page should load with informations of that room$/) do
  expect(page).to have_content('Sala: S10')
  expect(page).to have_content('Código: 124325')
  expect(page).to have_content('Capacidade: 50')
  expect(page).to have_content('Status: Ativo')
  expect(page).to have_content('Prédio: Pavilhão Anísio Teixeira')
end
