feature 'Sign up form' do

  scenario 'it allows the user to register' do
    sign_up
    expect(page.status_code).to eq(200)
  end

  scenario 'the user\'s information is displayed on the links page' do
    sign_up
    expect(page).to have_content('test@test.co.uk')
  end

end
