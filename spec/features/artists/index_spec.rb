require 'rails_helper'

RSpec.describe 'Artist Index Page', type: :feature do
  it 'displays an alphabetical list of all the artists' do
    artist1 = Artist.create(name: 'The Beatles', category: 'Group')
    artist2 = Artist.create(name: 'Bob Dylan', category: 'Solo')
    artist3 = Artist.create(name: 'The Rolling Stones', category: 'Group')

    visit "/"

    expect(artist1.name).to appear_before(artist2.name)
    expect(artist2.name).to appear_before(artist3.name)
    expect(artist3.name).to_not appear_before(artist1.name)
    expect(artist2.name).to_not appear_before(artist1.name)
  end

  it 'has a link to each artist show page' do
    artist1 = Artist.create(name: 'The Beatles', category: 'Group')

    visit "/"

    expect(page).to have_link('The Beatles')

    click_on "The Beatles"

    expect(current_path).to eq("/artists/#{artist1.id}")
  end

  it 'has a search box to search by artist' do
    artist1 = Artist.create(name: 'The Beatles', category: 'Group')
    artist2 = Artist.create(name: 'Bob Dylan', category: 'Solo')
    artist3 = Artist.create(name: 'The Rolling Stones', category: 'Group')

    visit "/"

    expect(page).to have_button('Search')

    fill_in 'Enter an artist name', with: 'The bea'
    click_button 'Search'

    expect(page).to have_content('The Beatles')
    expect(page).to_not have_content('Bob Dylan')
  end

  it 'returns a no albums found message when no results' do
    artist1 = Artist.create(name: 'The Beatles', category: 'Group')
    artist2 = Artist.create(name: 'Bob Dylan', category: 'Solo')
    artist3 = Artist.create(name: 'The Rolling Stones', category: 'Group')

    visit "/"

    expect(page).to have_button('Search')

    fill_in 'Enter an artist name', with: 'abcdefg'
    click_button 'Search'

    expect(page).to have_content('No artists found.')
  end
end