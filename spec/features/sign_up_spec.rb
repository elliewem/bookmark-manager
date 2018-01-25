feature 'Sign up form' do

  scenario 'it allows the user to register' do
    visit '/sign_up'
    fill_in('email', :with => 'test@test.co.uk')
    fill_in('password', :with => 'makers')
    click_button 'Submit'
    expect(page.status_code).to eq(200)
  end

  scenario 'the user\'s information is displayed on the links page' do
    visit '/sign_up'
    fill_in('email', :with => 'test@test.co.uk')
    fill_in('password', :with => 'makers')
    click_button 'Submit'
    expect(page).to have_content('test@test.co.uk')
  end

end
