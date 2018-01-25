feature 'Adding multiple tags' do

  scenario 'The user can assign multiple tags' do
    new_link
    link = Link.first
    expect(link.tags.map(&:name)).to include("Important", "General")
  end

end
