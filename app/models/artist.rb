class Artist < ApplicationRecord
  has_many :albums

  # old method that doesn't go by last name
  # def self.sort_alphabetically
  #   order(Arel.sql("CASE WHEN name LIKE 'The %' THEN SUBSTRING(name FROM 5) ELSE name END"))
  # end

  # old query before category column addition
  # def self.sort_alphabetically
  #   order(Arel.sql("CASE WHEN array_length(string_to_array(name, ' '), 1) > 1 THEN SPLIT_PART(name, ' ', array_length(string_to_array(name, ' '), 1)) ELSE name END"))
  # end  

  def self.sort_alphabetically
    solo_artists = where(category: 'Solo').sort_by(&:last_name)
    group_artists = where(category: 'Group').sort_by(&:name_without_article)
    solo_artists + group_artists
  end


  def self.search(query)
    where("name ILIKE ?", "%#{query}%")
  end

  def last_name
    name.split(' ', 2).last
  end

  def name_without_article
    name.start_with?('The ') ? name[4..-1] : name
  end
  
end