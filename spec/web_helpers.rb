def fill_in_form
  visit '/links/new'
  fill_in('page_name', with: 'Google')
  fill_in('page_url', with: 'http://www.google.com')
  fill_in('tags', with: 'search')
end
