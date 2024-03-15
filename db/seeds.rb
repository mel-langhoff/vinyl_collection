require 'csv'

CSV.foreach(Rails.root.join('db', 'data', 'artists.csv'), headers: true) do |row|
  Artist.create!(
    name: row['name']
  )
end

CSV.foreach(Rails.root.join('db', 'data', 'albums.csv'), headers: true) do |row|
  Album.create!(
    title: row['title'],
    notes: row['notes'],
    artist_id: row['artist_id']
  )
end
