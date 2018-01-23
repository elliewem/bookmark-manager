feature 'list of links saved output to user' do
  scenario 'user has saved a link - home page lists link' do
    Link.create(url: "http://www.elliewem.co.uk", title: "Ellie Wem")
    visit '/links'
    expect(page).to have_content('Ellie Wem')
  end
end
