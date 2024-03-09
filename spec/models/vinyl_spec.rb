require 'rails_helper'

RSpec.describe Vinyl, type: :model do
  describe "#alphabetized_artists" do

    it "returns a distinct list of artists alphabetically" do
      alphabetized_artists = Vinyl.alphabetized_artists

      expect(alphabetized_artists.first.name).to eq("10cc")
      expect(alphabetized_artists.last.name).to eq("Zevon")
    end
  end
end