require 'rails_helper'

RSpec.describe 'Album Index Page', type: :feature do
  it 'lists all albums' do
    beatles = Artist.create(name: 'The Beatles')
    help = Album.create(title: 'Help', artist: beatles)
    rubber_soul = Album.create(title: 'Rubber Soul', artist: beatles)
    abbey_road = Album.create(title: 'Abbey Road', artist: beatles)

    expect(page).to have_content('Help')
    expect(page).to have_content('Abbey Road')
    expect(page).to have_content('Rubber Soul')
  end
end