feature 'Add multiple tags to links' do

  before(:each) do
    @link = Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search web')])
  end

  scenario 'I can add multple tags to a link'do
    expect(@link.tags.map(&:name)).to include('search', 'web')
  end

end
