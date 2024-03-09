class Vinyl < ApplicationRecord
  def self.alphabetize_artists
    select("CASE 
              WHEN name LIKE '%, %' THEN CONCAT(SUBSTR(name, INSTR(name, ', ') + 2), ' ', SUBSTR(name, 1, INSTR(name, ', ') - 1))
                ELSE name 
              END AS sorted_name")
      .distinct
      .order("CASE 
                WHEN sorted_name LIKE 'The %' THEN SUBSTR(sorted_name, 5)
                ELSE sorted_name 
              END")
  end
end