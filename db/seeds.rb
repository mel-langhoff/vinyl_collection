require 'csv'
# require_relative '../app/models/vinyl'

CSV.foreach(Rails.root.join('db', 'data', 'vinyls.csv'), headers: true) do |row|
  Vinyl.create!(
    first_name: row['first_name'],
    last_name: row['last_name'],
    album_title: row['album_title'],
    notes: row['notes']
  )
end