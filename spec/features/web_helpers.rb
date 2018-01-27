def sign_up
  visit '/users/sign_up'
  fill_in('email', :with => 'test@test.co.uk')
  fill_in('password', :with => 'makers')
  fill_in('password_confirmation', :with => 'makers')
  click_button 'Submit'
end

def new_link
  visit '/links/new'
  fill_in('url', :with => 'www.google.com')
  fill_in('title', :with => 'Google')
  fill_in('tags', :with => 'Important General')
  click_button 'Submit'
end

def sign_up_wrong_password
  visit '/users/sign_up'
  fill_in('email', :with => 'imgoingtogetmyp@ssword.wrong')
  fill_in('password', :with => 'makers')
  fill_in('password_confirmation', :with => 'oops')
  click_button 'Submit'
end

def sign_up_without_email
  visit '/users/sign_up'
  fill_in('password', :with => 'makers')
  fill_in('password_confirmation', :with => 'makers')
  click_button 'Submit'
end
