require 'rails_helper'

RSpec.describe Artist, type: :model do

  describe 'relationship' do
    it { should have_many(:albums) }
  end

  it '#sort_alphabetically' do
    artist1 = Artist.create(name: 'The Beatles', category: 'Group')
    artist2 = Artist.create(name: 'Bob Dylan', category: 'Solo')
    artist3 = Artist.create(name: 'The Rolling Stones', category: 'Group')

    sorted_artists = Artist.sort_alphabetically

    expect(sorted_artists).to eq([artist1, artist2, artist3])
  end
end