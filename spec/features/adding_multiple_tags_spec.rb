feature 'Adding multiple tags' do

  scenario 'The user can assign multiple tags' do
    visit '/links/new'
    fill_in('url', :with => 'www.google.com')
    fill_in('title', :with => 'Google')
    fill_in('tags', :with => 'Important General')
    click_button 'Submit'
    link = Link.first
    expect(link.tags.map(&:name)).to include("Important", "General")
  end

end
