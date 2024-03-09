class Vinyl < ApplicationRecord
  def self.alphabetized_artists
    order(:last_name).distinct
  end
end

