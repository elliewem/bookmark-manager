feature 'list of links saved output to user' do
  scenario 'user has saved a link - home page lists link' do
    visit('/')
    fill_in 'new_link', :with => 'www.google.com'
    click_button 'save link'
    expect(page).to have_content "Your links: www.google.com"
  end
end
