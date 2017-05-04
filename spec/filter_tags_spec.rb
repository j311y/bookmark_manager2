feature 'filter tags' do
  scenario 'visits /(tag) and displays filtered tags' do
    fill_in_form
    click_button('Create new link')
    visit '/links/new'
    fill_in('page_name', with: 'GitHub')
    fill_in('page_url', with: 'http://www.github.com')
    fill_in('tags', with: 'coding')
    click_button('Create new link')

    visit '/links/search'
    expect(page).to have_content 'Google'
    expect(page).not_to have_content 'GitHub'
  end
end
