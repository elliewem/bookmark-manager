feature 'Creating tags' do

  scenario 'The user can create a tag' do
    new_link
    link = Link.first
    expect(link.tags.map(&:name)).to include("Important")
  end

end
