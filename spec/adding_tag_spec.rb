feature 'Add single tag' do
  scenario 'user can add a single tag to a link' do
    visit '/links/new'
    fill_in('page_name', with: 'Google')
    fill_in('page_url', with: 'http://www.google.com')
    fill_in('tags', with: 'search')
    click_button('Create new link')

    link = Link.first
    expect(link.tags.map(&:name)).to include('search')
  end
end
