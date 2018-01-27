feature 'Confirming passwords' do

  scenario 'no new users are created if password does not match' do
    sign_up_wrong_password
    expect(User.count).to eq 0
  end

  scenario 'a new user is created if passwords match' do
    sign_up
    expect(User.count).to eq 1
  end

  scenario 'the user is displayed an error message if passwords are incorrect' do
    sign_up_wrong_password
    expect(current_path).to eq('/users/sign_up')
    expect(page).to have_content("The passwords do not match. Please try again.")
  end

end
