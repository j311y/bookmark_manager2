feature 'Add single tag' do
  scenario 'user can add a single tag to a link' do
    fill_in_form
    click_button('Create new link')

    link = Link.first
    expect(link.tags.map(&:name)).to include('search')
  end
end
