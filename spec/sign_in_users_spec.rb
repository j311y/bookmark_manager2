feature 'signs in users' do
  scenario 'user signs in' do
    visit '/sign_in'
    fill_in('email', with: 'jon@example.com')
    fill_in('password', with: 'password')
    save_and_open_page
    click_button('Submit')
    expect(current_path). to eq '/links/index'

    expect(page).to have_content 'Welcome jon@example.com'
    expect { User.create }.to change { User.last.id }.by(1)
  end
end
