require 'rails_helper'

RSpec.describe 'Artist Show Page', type: :feature do
  it 'displays a list of all the artists albums' do
    beatles = Artist.create(name: 'The Beatles')
    help = Album.create(title: 'Help', artist: beatles)
    rubber_soul = Album.create(title: 'Rubber Soul', artist: beatles)
    abbey_road = Album.create(title: 'Abbey Road', artist: beatles)

    visit "/artists/#{beatles.id}"

    expect(page).to have_content(help.title)
    expect(page).to have_content(rubber_soul.title)
    expect(page).to have_content(abbey_road.title)
  end
end