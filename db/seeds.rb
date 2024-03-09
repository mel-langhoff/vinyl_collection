require 'csv'
# require_relative '../app/models/vinyl'

CSV.foreach(Rails.root.join('db', 'data', 'vinyls.csv'), headers: true) do |row|
  Vinyl.create!(
    name: row['name'],
    album_title: row['album_title'],
    notes: row['notes']
    # Add more attributes as needed
  )
end
