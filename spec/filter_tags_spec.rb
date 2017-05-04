feature 'filter tags' do

    before(:each) do
        Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
        Link.create(url: 'http://www.github.com', title: 'GitHub', tags: [Tag.first_or_create(name: 'coding')])
    end

    scenario 'I can filter links by tag' do
      visit '/tags/search'

      within 'ul#links' do
        expect(page).to have_content 'Google'
        expect(page).not_to have_content 'GitHub'
      end
  end
end
