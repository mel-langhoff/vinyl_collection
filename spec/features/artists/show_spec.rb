require 'rails_helper'

RSpec.describe 'Artist Show Page', type: :feature do
  it 'displays an alphabetical list of all the artists albums' do
    beatles = Artist.create(name: 'The Beatles')
    help = Album.create(title: 'Help', artist: beatles)
    rubber_soul = Album.create(title: 'Rubber Soul', artist: beatles)
    abbey_road = Album.create(title: 'Abbey Road', artist: beatles)

    visit "/#{beatles.id}"

    expect(abbey_road.title).to appear_before(help.title)
    expect(help.title).to appear_before(rubber_soul.title)
    expect(help.title).to_not appear_before(abbey_road.title)
    expect(rubber_soul.title).to_not appear_before(help.title)
  end
end