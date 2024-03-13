require 'rails_helper'

RSpec.describe Vinyl, type: :model do
  before(:all) do
    @vinyls = [
      { id: 1, first_name: 'John', last_name: 'Lennon', album_title: 'Imagine', notes: 'Classic album' },
      { id: 2, first_name: 'Paul', last_name: 'McCartney', album_title: 'Band on the Run', notes: 'Another classic album' },
      { id: 3, first_name: 'Frank', last_name: 'Zappa', album_title: 'Overnite Sensation', notes: 'Yet another classic album' },
    ]

    @vinyls.each do |vinyl_data|
      Vinyl.create!(
        first_name: vinyl_data[:first_name],
        last_name: vinyl_data[:last_name],
        album_title: vinyl_data[:album_title],
        notes: vinyl_data[:notes]
      )
    end
  end

  describe "#alphabetized_artists" do

    it "returns a distinct list of artists alphabetically" do
      alphabetized_artists = Vinyl.alphabetized_artists

      expect(alphabetized_artists.first.last_name).to eq("Lennon")
      expect(alphabetized_artists.last.last_name).to eq("Zappa")
    end
  end
end