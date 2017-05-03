require './app/models/link'

feature 'Viewing Links' do

  scenario 'I can see existing links on the links page' do
    Link.create(url: 'http://makersacademy.com', title: 'Makers Academy')

    visit '/Links'

    expect(page.status_code).to eq 200

    within 'ul#links' do 
      expect(page).to have_content('Makers Academy')
    end
  end
end

# Bookmarks (add(link), list, sort)
# Links (create, add(tag))
# Tags (create)
