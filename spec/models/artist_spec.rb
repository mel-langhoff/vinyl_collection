require 'rails_helper'

RSpec.describe Artist, type: :model do

  describe 'relationship' do
    it { should have_many(:albums) }
  end

  it '#alphabetical_list' do
    artist1 = Artist.create(name: 'The Beatles')
    artist2 = Artist.create(name: 'Bob Dylan')
    artist3 = Artist.create(name: 'The Rolling Stones')

    sorted_artists = Artist.sort_alphabetically

    expect(sorted_artists).to eq([artist1, artist2, artist3])
  end
end