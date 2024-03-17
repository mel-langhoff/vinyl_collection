require 'rails_helper'

RSpec.describe 'Album Index Page', type: :feature do
  it 'lists all albums' do
    beatles = Artist.create(name: 'The Beatles')
    help = Album.create(title: 'Help', artist: beatles)
    rubber_soul = Album.create(title: 'Rubber Soul', artist: beatles)
    abbey_road = Album.create(title: 'Abbey Road', artist: beatles)

    visit "/albums"
    
    expect(page).to have_content('Help')
    expect(page).to have_content('Abbey Road')
    expect(page).to have_content('Rubber Soul')
  end

  it 'has a search form and redirects to the results' do
    beatles = Artist.create(name: 'The Beatles')
    help = Album.create(title: 'Help', artist: beatles)
    rubber_soul = Album.create(title: 'Rubber Soul', artist: beatles)
    abbey_road = Album.create(title: 'Abbey Road', artist: beatles)

    visit "/albums"

    expect(page).to have_button("Search")

    fill_in 'Enter an album name', with: 'rub'
    click_button 'Search'

    expect(page).to have_content('Rubber Soul')
    expect(page).to_not have_content('Abbey Road')
  end

  it 'returns a no albums found message when no results' do
    beatles = Artist.create(name: 'The Beatles')
    help = Album.create(title: 'Help', artist: beatles)
    rubber_soul = Album.create(title: 'Rubber Soul', artist: beatles)
    abbey_road = Album.create(title: 'Abbey Road', artist: beatles)

    visit "/albums"

    expect(page).to have_button("Search")

    fill_in 'Enter an album name', with: 'abcdefg'
    click_button 'Search'

    expect(page).to have_content('No albums found.')
  end
end