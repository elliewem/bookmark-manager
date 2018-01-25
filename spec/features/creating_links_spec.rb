require 'database_cleaner'
feature 'Creating links' do

  scenario 'The user can create a link' do
    new_link
    expect(page).to have_content('Google')
  end

end
