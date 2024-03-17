require 'csv'

puts "Seeding artists..."
CSV.foreach(Rails.root.join('db', 'data', 'artists.csv'), headers: true) do |row|
  puts "Creating artist: #{row['name']} (Category: #{row['category']})"
  artist = Artist.new(
    name: row['name'],
    category: row['category']
  )
  if artist.save
    puts "Artist created successfully!"
  else
    puts "Failed to create artist: #{artist.errors.full_messages.join(', ')}"
  end
end

puts "Seeding albums..."
CSV.foreach(Rails.root.join('db', 'data', 'albums.csv'), headers: true) do |row|
  puts "Creating album: #{row['title']}"
  album = Album.new(
    title: row['title'],
    notes: row['notes'],
    artist_id: row['artist_id']
  )
  if album.save
    puts "Album created successfully!"
  else
    puts "Failed to create album: #{album.errors.full_messages.join(', ')}"
  end
end
