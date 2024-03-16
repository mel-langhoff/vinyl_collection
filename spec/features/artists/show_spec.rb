require 'rails_helper'

RSpec.describe 'Artist Show Page', type: :feature do
  it 'displays an alphabetical list of all the artists albums' do
    beatles = Artist.create(name: 'The Beatles')
    help = Album.create(name: 'Help', artist: beatles)
    rubber_soul = Album.create(name: 'Rubber Soul', artist: beatles)
    abbey_road = Album.create(name: 'Abbey Road', artist: beatles)

    visit "/#{beatles.name}"

    expect(abbey_road.name).to appear_before(help.name)
    expect(help.name).to appear_before(rubber_soul.name)
    expect(help.name).to_not appear_before(abbey_road.name)
    expect(rubber_soul.name).to_not appear_before(help.name)
  end
end