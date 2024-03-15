class Artist < ApplicationRecord
  has_many :albums

  def self.sort_alphabetically
    order(Arel.sql("CASE WHEN name LIKE 'The %' THEN SUBSTRING(name FROM 5) ELSE name END"))
  end
end