class AddCategoryToArtists < ActiveRecord::Migration[7.1]
  def change
    add_column :artists, :category, :string
  end
end
