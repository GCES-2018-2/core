And (/^click on link 'Icon pdf'$/) do
  click_link('Icon pdf', match: :first)
end

And (/^click on button 'searchButton'$/) do
  click_button('searchButton')
end

And (/^click on link 'Disciplinas' in 'Relatório'$/) do
    find('#sidebar-button-report').click_link('Disciplinas')
end

And (/^fill 'name' with '([^"]*)'$/) do |content|
    fill_in('name', with: content)
end

Then (/^the 'Relatório por Disciplina' page show some disciplines$/) do
    expect(page).to have_content('Cálculo 3')
    expect(page).to have_content('Cálculo 2')
    expect(page).to have_content('Cálculo 1')
    expect(page).to have_content('Artes Visuais')
end

Then (/^the 'Relatório por Disciplina' page show '([^"]*)'$/) do |content|
    expect(page).to have_content(content)
end
