class Vinyl < ApplicationRecord
  def self.alphabetized_artists
    select(:last_name).distinct.order(:last_name)
  end
end

