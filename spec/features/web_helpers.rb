def sign_up
  visit '/sign_up'
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
