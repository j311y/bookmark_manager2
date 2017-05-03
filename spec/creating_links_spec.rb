feature 'creating links' do
  scenario 'I can create a link by inputting into a form' do
    visit '/links/new'
    fill_in('page_name', with: 'Google')
    fill_in('page_url', with: 'http://www.google.com')
    click_button('Create new link')

    expect(current_path).to eq '/links'
    expect(page).to have_content('Google')
    expect(page).to have_content('http://www.google.com')
  end
end
