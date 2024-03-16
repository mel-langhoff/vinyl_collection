require 'rails_helper'

RSpec.describe 'Artist Index Page', type: :feature do
  it 'displays an alphabetical list of all the artists' do
    artist1 = Artist.create(name: 'The Beatles')
    artist2 = Artist.create(name: 'Bob Dylan')
    artist3 = Artist.create(name: 'The Rolling Stones')

    visit root_path

    expect(artist1.name).to appear_before(artist2.name)
    expect(artist2.name).to appear_before(artist3.name)
    expect(artist3.name).to_not appear_before(artist1.name)
    expect(artist2.name).to_not appear_before(artist1.name)
  end

  it 'has a link to each artist show page' do
    artist1 = Artist.create(name: 'The Beatles')

    visit root_path

    expect(page).to have_link('The Beatles')

    click_on "The Beatles"

    expect(current_path).to eq("/artists/#{artist1.id}")
  end

  it 'has a search box to search by artist' do

  end

  it 'has a search box to search by album' do
    
  end
end