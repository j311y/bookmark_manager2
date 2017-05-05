feature 'Add multiple tags to links' do

  before(:each) do
    @link = Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search web')])
  end

  scenario 'I can add multiple tags to a link'do
    visit '/links/index'
    expect(page).to have_content('search')
    expect(page).to have_content('web')
  end

end
