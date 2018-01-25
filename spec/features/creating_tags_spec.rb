feature 'Creating tags' do

  scenario 'The user can create a tag' do
    visit '/links/new'
    fill_in('url', :with => 'www.google.com')
    fill_in('title', :with => 'Google')
    fill_in('tags', :with => 'Important')
    click_button 'Submit'
    link = Link.first
    expect(link.tags.map(&:name)).to include("Important")
  end

end
