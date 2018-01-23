require 'database_cleaner'
feature 'Creating links' do

  scenario 'The user can create a link' do
    visit '/links/new'
    fill_in('url', :with => 'www.google.com')
    fill_in('title', :with => 'Google')
    click_button('Submit')
    p Link.all
    expect(page).to have_content('Google')
  end

end
