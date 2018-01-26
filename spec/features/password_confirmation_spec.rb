feature 'Confirming passwords' do

  scenario 'no new users are created if password does not match' do
    visit '/sign_up'
    fill_in('email', :with => 'imgoingtogetmyp@ssword.wrong')
    fill_in('password', :with => 'makers')
    fill_in('password_confirmation', :with => 'oops')
    click_button 'Submit'
    expect(User.count).to eq 0
  end

end
