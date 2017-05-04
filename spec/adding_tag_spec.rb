feature 'Add single tag' do
  scenario 'user can add a single tag to a link' do
    visit '/links/new'
    fill_in('page_name', with: 'Google')
    fill_in('page_url', with: 'http://www.google.com')
    fill_in('tag', with: 'search')
    click_button('Create new link')

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('Google')
      expect(page).to have_content('http://www.google.com')
      expect(page).to have_content('search')
    end
  end
end
