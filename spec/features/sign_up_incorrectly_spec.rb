feature 'Sign up incorrectly' do

  scenario 'a user is not created if email field isn\'t completed' do
    sign_up_without_email
    expect(page).to have_content("Email")
  end

end
