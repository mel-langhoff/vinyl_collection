class Album < ApplicationRecord
  belongs_to :artist

  def self.search(query)
    where("title ILIKE ?", "%#{query}%")
  end
end