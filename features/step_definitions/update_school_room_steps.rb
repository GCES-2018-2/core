
And (/^click on edit first$/) do
    first(:link, 'Icon edit').click
end

When (/^I press 'Alterar' button$/) do
    click_button('Alterar')
end

Then (/^notice message '([^"]*)'$/) do |message|
	expect(page).to have_content(message)
end

And (/^I uncheck 'Engenharia Eletronica'$/) do
   find(:css, "#school_room_course_ids_2").set(false)
end

And (/^I uncheck 'Engenharia Automotiva'$/) do
   find(:css, "#school_room_course_ids_3").set(false)
end

And (/^I uncheck 'Artes Visuais'$/) do
   find(:css, "#school_room_course_ids_4").set(false)
end
