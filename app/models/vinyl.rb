class Vinyl < ApplicationRecord
  attribute :first_name, :string

  def self.alphabetized_artists
    select(:last_name).distinct.order(:last_name)
  end
end

