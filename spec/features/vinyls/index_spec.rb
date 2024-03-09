require 'rails_helper'

RSpec.describe 'Vinyls Index Page', type: :feature do
  before(:all) do
    # Custom data setup
    @vinyls = [
      { id: 1, first_name: 'John', last_name: 'Lennon', album_title: 'Imagine', notes: 'Classic album' },
      { id: 2, first_name: 'Paul', last_name: 'McCartney', album_title: 'Band on the Run', notes: 'Another classic album' },
      { id: 2, first_name: 'Frank', last_name: 'Zappa', album_title: 'Overnite Sensation', notes: 'Yet another classic album' },
      # Add more sample data as needed
    ]

    # Create Vinyl records using custom data
    @vinyls.each do |vinyl_data|
      Vinyl.create!(
        first_name: vinyl_data[:first_name],
        last_name: vinyl_data[:last_name],
        album_title: vinyl_data[:album_title],
        notes: vinyl_data[:notes]
      )
    end
  end
  
  describe 'user story 1' do
    it 'has a list of all artists alphabetically' do
      visit "/vinyls"

      # Check if the page contains the expected content
      expect(page).to have_content("John Lennon")
      expect(page).to have_content("Paul McCartney")
      # Add more expectations for other vinyls
    end

    it 'has a link to the vinyl show page next to each artist' do
      visit "/vinyls"

      # Check if the links are present and have the correct text
      expect(page).to have_link("John Lennon", href: "/vinyls/Lennon")
      expect(page).to have_link("Paul McCartney", href: "/vinyls/McCartney")
      # Add more expectations for other vinyls
    end
  end
end
