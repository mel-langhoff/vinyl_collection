class Vinyl < ApplicationRecord
  def self.alphabetized_artists
    order(name: :asc).distinct
  end
end

