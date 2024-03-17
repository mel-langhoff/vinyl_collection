class Artist < ApplicationRecord
  has_many :albums

  # old method that doesn't go by last name
  # def self.sort_alphabetically
  #   order(Arel.sql("CASE WHEN name LIKE 'The %' THEN SUBSTRING(name FROM 5) ELSE name END"))
  # end

  def self.sort_alphabetically
    order(Arel.sql("CASE WHEN array_length(string_to_array(name, ' '), 1) > 1 THEN SPLIT_PART(name, ' ', array_length(string_to_array(name, ' '), 1)) ELSE name END"))
  end  

  def self.search(query)
    where("name ILIKE ?", "%#{query}%")
  end
end